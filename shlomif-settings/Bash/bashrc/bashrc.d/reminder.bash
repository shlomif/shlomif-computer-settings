reminder_file="$HOME/.local/share/shlomif/reminder/reminder.txt"
if [ -s "$reminder_file" ] ; then
    perl -Mstrict -Mwarnings -MTerm::ANSIColor -E 'my $x = colored("===", "bold red"); say "$x Reminders $x"'
    cat "$reminder_file"
fi

Cancel_reminder()
{
    rm "$reminder_file"
}
