# Taken from:
# https://stackoverflow.com/questions/10346419/save-command-history-in-pdb
# Thanks!


def _pdbrc_init():
    # Save history across sessions
    import readline
    histfile = ".pdb-pyhist"
    try:
        readline.read_history_file(histfile)
    except IOError:
        pass
    import atexit
    atexit.register(readline.write_history_file, histfile)
    readline.set_history_length(50000)


_pdbrc_init()
del _pdbrc_init
