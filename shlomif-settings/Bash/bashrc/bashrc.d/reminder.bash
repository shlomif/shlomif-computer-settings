reminder_file="$HOME/.local/share/shlomif/reminder/reminder.txt"

__display_reminder()
{
    if [ -s "$reminder_file" ] ; then
        perl -Mstrict -Mwarnings -MTerm::ANSIColor -E 'my $x = colored("===", "bold red"); say "$x Reminders $x"'
        cat "$reminder_file"
    fi
}
__display_reminder
export PROMPT_COMMAND='__display_reminder'

Cancel_reminder()
{
    rm "$reminder_file"
}
