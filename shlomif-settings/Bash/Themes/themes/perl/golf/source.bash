load_common prompt

base="$HOME/progs/riddles/golf/golf.shinh.org/challenges"

alias caddy="ruby $HOME/progs/riddles/golf/golf.shinh.org/caddy-tool-for-golfers/caddy/caddy.rb"

# This is so Perl Golf test suites will backup the scripts
export GOLF_BACKUP=0.5

prompt()
{
    __prompt_cmd \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u[golf]:\$(prompt)\\$ "
