from neovim import attach
nvim = attach('child', argv=["nvim", "--embed", '+mak'])
nvim.ui_attach(100, 100, True)
