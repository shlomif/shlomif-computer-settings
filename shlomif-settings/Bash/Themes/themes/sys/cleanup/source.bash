load_common du
load_common prompt


cd "$HOME"

prompt()
{
    __prompt_cmd \
        "~=$HOME"
}

-l()
{
    rpm -qa | (LC_ALL=C sort) > ~/rpm-qa.txt
}

proj_name='cleanup'
