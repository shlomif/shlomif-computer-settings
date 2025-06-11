reminder_file="$HOME/.local/share/shlomif/reminder/reminder.txt"

(
    dn="$(dirname "$reminder_file")"
    if ! test -d "$dn"
    then
        mkdir -p "$dn"
    fi
)

__git_info_prompt_command()
{
    true
}

__display_reminder()
{
    __git_info_prompt_command
    if test -s "$reminder_file"
    then
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
