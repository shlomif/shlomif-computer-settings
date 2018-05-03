load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/Work/insurgent"
git_base="$base/git"
git_dir="$git_base/www.insurgentsoftware.com"
auth="$git_dir"
this="$auth"
proj_name="Insurgent"

prompt()
{
    __prompt_cmd \
        "\$auth=$auth" \
        "\$git_dir=$git_dir" \
        "\$base=$base" \
        "~=$HOME"
}

t()
{
    (cd "$auth" && make runtest)
}

# Short for push.
Pu()
{
    (cd "$auth" && git push origin master)
}

pull()
{
    (cd "$auth" && git pull)
}

st()
{
    (cd "$auth" && git st)
}

myfiles="user-auth.pl t/login.t"

e()
{
    (cd "$auth" && gvim -o $myfiles)
}

serve()
{
    (cd "$auth" && ./user-auth.pl "daemon")
}

add()
{
    (cd "$auth" && git add $myfiles \
        public/*.css InsurgentSoftware/UserAuth/*.pm \
        InsurgentSoftware/UserAuth/*/*.pm
    )
}
cd $this
