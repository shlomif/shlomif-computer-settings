if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
for f in ~/conf/trunk/shlomif-settings/Bash/bashrc/bashrc.d/*.bash ; do
    . "$f"
done
PATH="$HOME/apps/neovim/bin:$HOME/apps/fop/fop-20140425:$HOME/apps/vim/bin:$PATH"
dedup_pathvar PATH
