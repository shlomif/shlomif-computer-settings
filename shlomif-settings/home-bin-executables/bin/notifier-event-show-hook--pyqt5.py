#!/usr/bin/env python3

"""

notifier-event-show-hook--pyqt5.py

Play a vlc video/etc. in a window while displaying a textual message.

Based on:

<<<
A simple example for VLC python bindings using PyQt5.

Author: Saveliy Yusufov, Columbia University, sy2685@columbia.edu
Date: 25 December 2018
>>>

https://git.videolan.org/?p=vlc/bindings/python.git;a=blob;f=examples/pyqt5vlc.py;h=abf0cf20b38cae0a3faf39044d2d97b48a4f39f1;hb=HEAD

Modified by Shlomi Fish ( https://www.shlomifish.org/ ) while disclaiming all
explicit or implicit copyrights claims.

"""

import fcntl
import platform
import re
import sys
import time
from pathlib import Path

from PyQt5 import QtCore, QtGui, QtWidgets

import click

import vlc


class Player(QtWidgets.QMainWindow):
    def __init__(self, video_fn, msg, master=None):
        QtWidgets.QMainWindow.__init__(self, master)
        self.setWindowTitle("Notification:" + msg)

        # Create a basic vlc instance
        self.instance = vlc.Instance()

        self.media = None

        # Create an empty vlc media player
        self.mediaplayer = self.instance.media_player_new()

        self.create_ui(msg)
        self.is_paused = False
        self.open_file(video_fn)

    def create_ui(self, msg):
        """Set up the user interface, signals & slots
        """
        self.widget = QtWidgets.QWidget(self)
        self.setCentralWidget(self.widget)

        # In this widget, the video will be drawn
        if platform.system() == "Darwin":
            self.videoframe = QtWidgets.QMacCocoaViewContainer(0)
        else:
            self.videoframe = QtWidgets.QFrame()

        self.palette = self.videoframe.palette()
        self.palette.setColor(QtGui.QPalette.Window, QtGui.QColor(0, 0, 0))
        self.videoframe.setPalette(self.palette)
        self.videoframe.setAutoFillBackground(True)

        self.vlayout = QtWidgets.QVBoxLayout()
        self.vlayout.addWidget(self.videoframe)

        self.message_text = QtWidgets.QLineEdit(self)
        self.message_text.setText(msg)
        self.message_text.setReadOnly(True)
        f = self.message_text.font()
        f.setPointSize(20)
        self.message_text.setFont(f)
        self.vlayout.addWidget(self.message_text)

        self.widget.setLayout(self.vlayout)

        menu_bar = self.menuBar()

        file_menu = menu_bar.addMenu("&File")

        close_action = QtWidgets.QAction("E&xit", self)
        file_menu.addAction(close_action)

        close_action.triggered.connect(sys.exit)

        self.timer = QtCore.QTimer(self)
        self.timer.setInterval(100)
        self.timer.timeout.connect(self.update_ui)

        quit = QtWidgets.QAction(self)
        quit.setShortcut(QtGui.QKeySequence(QtGui.QKeySequence.Quit))
        quit.triggered.connect(sys.exit)
        self.addAction(quit)

    def play_pause(self):
        """Toggle play/pause status
        """
        if self.mediaplayer.is_playing():
            self.mediaplayer.pause()
            self.is_paused = True
            self.timer.stop()
        else:
            if self.mediaplayer.play() == -1:
                self.open_file()
                return

            self.mediaplayer.play()
            self.timer.start()
            self.is_paused = False

    def stop(self):
        self.mediaplayer.stop()

    def open_file(self, filename):
        """Open a media file in a MediaPlayer
        """

        # getOpenFileName returns a tuple, so use only the actual file name
        self.media = self.instance.media_new(filename)

        # Put the media in the media player
        self.mediaplayer.set_media(self.media)

        # Parse the metadata of the file
        self.media.parse()

        # The media player has to be 'connected' to the QFrame (otherwise the
        # video would be displayed in it's own window). This is platform
        # specific, so we must give the ID of the QFrame (or similar object) to
        # vlc. Different platforms have different functions for this
        if platform.system() == "Linux":  # for Linux using the X Server
            self.mediaplayer.set_xwindow(int(self.videoframe.winId()))
        elif platform.system() == "Windows":  # for Windows
            self.mediaplayer.set_hwnd(int(self.videoframe.winId()))
        elif platform.system() == "Darwin":  # for MacOS
            self.mediaplayer.set_nsobject(int(self.videoframe.winId()))

        self.play_pause()

    def set_volume(self, volume):
        """Set the volume
        """
        self.mediaplayer.audio_set_volume(volume)

    def update_ui(self):
        # No need to call this function if nothing is played
        if not self.mediaplayer.is_playing():
            self.timer.stop()

            # After the video finished, the play button stills shows "Pause",
            # which is not the desired behavior of a media player.
            # This fixes that "bug".
            if not self.is_paused:
                self.stop()


DEFAULT_MESSAGE = "Your task has finished - go check it out!"


@click.command()
@click.option("--song", default="/home/shlomif/Music/mp3s/" +
              "Jessie J - Domino-UJtB55MaoD0.webm", help="file to play")
@click.option("-m", "--msg", "--message",
              default=DEFAULT_MESSAGE,
              help="notification message")
def main(song, msg):
    """Entry point for our simple vlc player
    """
    if not len(msg):
        msg = DEFAULT_MESSAGE
    dir_ = Path.home() / '.local' / 'share' / 'App-Notifier'
    dir_.mkdir(parents=True, exist_ok=True)
    lockfile = dir_ / 'log.lock'
    lockfile.touch()
    with open(lockfile, 'a') as f:
        fcntl.flock(f, fcntl.LOCK_EX)
        with open(dir_ / "log.txt", 'at') as log_f:
            log_f.write("{}\t{}\t{}\n".format(
                "RECEIVED", time.time(),
                re.match("^([^\\r\\n\\t]*)", msg).group(1)))
        fcntl.flock(f, fcntl.LOCK_UN)

    app = QtWidgets.QApplication(sys.argv)
    player = Player(song, msg)
    player.show()
    player.resize(640, 480)
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()
