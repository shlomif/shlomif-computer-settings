load_common bundle/inc1

base="$HOME/progs/java/Eclipse/workspace/NurikabeGarden"
git_base="$base"
trunk="$base"
this="$trunk"

# Add GWT (Google Web Toolkit) to the PATH.
PATH="$HOME/Download/unpack/prog/gwt-google-web-toolkit/gwt-2.6.0:$PATH"

cd "$this"

source CLASSPATH-source-me.sh

t()
{
    cd "$this" && ./Build runtest
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='nurikabe'
