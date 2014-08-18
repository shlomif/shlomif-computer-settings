#!/bin/bash
process_dir()
{
    mytype="$1"
    shift
    dir="$1"
    shift
    sa-learn --showdots "$mytype" --dir "$dir"/Received/cur
    # mv "$dir"/Received/cur/* "$dir"/Saved/cur/
}
process_dir --spam "$HOME"/.Mail/.Spam.directory/.Spam.directory/
process_dir --spam "$HOME"/.Mail/.Spam.directory/.Uncaught.directory/
process_dir --ham "$HOME"/.Mail/.Spam.directory/.Ham.directory/
sa-learn --showdots --ham --dir "$HOME"/.Mail/.Spam.directory/.Ham.directory/"To Delete"/cur/
sa-learn --showdots --spam --dir "$HOME"/.Mail/.Spam.directory/.Spam.directory/"To Delete"/cur/

