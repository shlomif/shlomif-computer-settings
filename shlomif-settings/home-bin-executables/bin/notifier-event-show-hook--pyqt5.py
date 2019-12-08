#!/usr/bin/env python3

"""
A simple example for VLC python bindings using PyQt5.

Author: Saveliy Yusufov, Columbia University, sy2685@columbia.edu
Date: 25 December 2018
"""

import click

import platform
import os
import sys

from PyQt5 import QtWidgets, QtGui, QtCore
import vlc

class Player(QtWidgets.QMainWindow):
    """A simple Media Player using VLC and Qt
    """

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
        if platform.system() == "Darwin": # for MacOS
            self.videoframe = QtWidgets.QMacCocoaViewContainer(0)
        else:
            self.videoframe = QtWidgets.QFrame()

        self.palette = self.videoframe.palette()
        self.palette.setColor(QtGui.QPalette.Window, QtGui.QColor(0, 0, 0))
        self.videoframe.setPalette(self.palette)
        self.videoframe.setAutoFillBackground(True)

        if False:
            self.positionslider = QtWidgets.QSlider(QtCore.Qt.Horizontal, self)
            self.positionslider.setToolTip("Position")
            self.positionslider.setMaximum(1000)
            self.positionslider.sliderMoved.connect(self.set_position)
            self.positionslider.sliderPressed.connect(self.set_position)

        self.vlayout = QtWidgets.QVBoxLayout()
        self.close_button = QtWidgets.QPushButton("Close")
        self.vlayout.addWidget(self.close_button)
        self.close_button.clicked.connect(self.play_pause)

        # self.stopbutton = QtWidgets.QPushButton("Stop")
        # self.vlayout.addWidget(self.stopbutton)
        # self.stopbutton.clicked.connect(self.stop)

        # self.vlayout.addStretch(1)
        if False:
            self.volumeslider = QtWidgets.QSlider(QtCore.Qt.Horizontal, self)
            self.volumeslider.setMaximum(100)
            self.volumeslider.setValue(self.mediaplayer.audio_get_volume())
            self.volumeslider.setToolTip("Volume")
            # self.hbuttonbox.addWidget(self.volumeslider)
            self.volumeslider.valueChanged.connect(self.set_volume)

        # self.vboxlayout = QtWidgets.QVBoxLayout()
        self.vlayout.addWidget(self.videoframe)
        # self.vboxlayout.addLayout(self.hbuttonbox)

        if 1:
            self.message_text = QtWidgets.QLineEdit(self)
            self.message_text.setText(msg)
            self.message_text.setReadOnly(True)
            f = self.message_text.font()
            f.setPointSize(30)
            self.message_text.setFont(f)
            # self.message_text.resize(400,100)
            self.vlayout.addWidget(self.message_text)

        self.widget.setLayout(self.vlayout)

        menu_bar = self.menuBar()

        # File menu
        file_menu = menu_bar.addMenu("&File")

        # Add actions to file menu
        close_action = QtWidgets.QAction("E&xit", self)
        file_menu.addAction(close_action)

        close_action.triggered.connect(sys.exit)

        self.timer = QtCore.QTimer(self)
        self.timer.setInterval(100)
        self.timer.timeout.connect(self.update_ui)

    def play_pause(self):
        """Toggle play/pause status
        """
        if self.mediaplayer.is_playing():
            self.mediaplayer.pause()
            self.close_button.setText("Play")
            self.is_paused = True
            self.timer.stop()
        else:
            if self.mediaplayer.play() == -1:
                self.open_file()
                return

            self.mediaplayer.play()
            self.close_button.setText("Pause")
            self.timer.start()
            self.is_paused = False

    def stop(self):
        """Stop player
        """
        self.mediaplayer.stop()
        self.close_button.setText("Play")

    def open_file(self, filename):
        """Open a media file in a MediaPlayer
        """

        # getOpenFileName returns a tuple, so use only the actual file name
        self.media = self.instance.media_new(filename)

        # Put the media in the media player
        self.mediaplayer.set_media(self.media)

        # Parse the metadata of the file
        self.media.parse()

        if False:
            # Set the title of the track as window title
            self.setWindowTitle(self.media.get_meta(0))

        # The media player has to be 'connected' to the QFrame (otherwise the
        # video would be displayed in it's own window). This is platform
        # specific, so we must give the ID of the QFrame (or similar object) to
        # vlc. Different platforms have different functions for this
        if platform.system() == "Linux": # for Linux using the X Server
            self.mediaplayer.set_xwindow(int(self.videoframe.winId()))
        elif platform.system() == "Windows": # for Windows
            self.mediaplayer.set_hwnd(int(self.videoframe.winId()))
        elif platform.system() == "Darwin": # for MacOS
            self.mediaplayer.set_nsobject(int(self.videoframe.winId()))

        self.play_pause()

    def set_volume(self, volume):
        """Set the volume
        """
        self.mediaplayer.audio_set_volume(volume)

    def update_ui(self):
        """Updates the user interface"""

        # Set the slider's position to its corresponding media position
        # Note that the setValue function only takes values of type int,
        # so we must first convert the corresponding media position.
        media_pos = int(self.mediaplayer.get_position() * 1000)

        # No need to call this function if nothing is played
        if not self.mediaplayer.is_playing():
            self.timer.stop()

            # After the video finished, the play button stills shows "Pause",
            # which is not the desired behavior of a media player.
            # This fixes that "bug".
            if not self.is_paused:
                self.stop()

@click.command()
@click.option("--video", default="/home/shlomif/Music/mp3s/Jessie J - Domino-UJtB55MaoD0.webm", help="file to play")
@click.option("-m", "--msg", default="Your task has finished - go check it out!", help="notification message")
def main(video, msg):
    """Entry point for our simple vlc player
    """
    app = QtWidgets.QApplication(sys.argv)
    player = Player(video, msg)
    player.show()
    player.resize(640, 480)
    sys.exit(app.exec_())

if __name__ == "__main__":
    main()
