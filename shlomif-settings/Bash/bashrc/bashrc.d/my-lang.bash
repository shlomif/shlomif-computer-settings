if test -e "$HOME/.i18n"
then
    eval "$(perl -0777 -pE 's/[\r\n]/ /g;/\S/ ? s#\A#export # : ($_ = "true")' < "$HOME/.i18n")"
fi
