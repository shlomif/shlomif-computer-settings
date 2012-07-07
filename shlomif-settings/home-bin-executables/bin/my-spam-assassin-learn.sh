#!/bin/bash
process_dir()
{
    mytype="$1"
    shift
    dir="$1"
    shift
    sa-learn --showdots "$mytype" --dir "$dir"/Received
    # mv "$dir"/Received/cur/* "$dir"/Saved/cur/
}
process_dir --spam "$HOME"/Mail/Spam/Spam/
process_dir --spam "$HOME"/Mail/Spam/Uncaught/
process_dir --ham "$HOME"/Mail/Spam/Ham/
sa-learn --showdots --ham --dir "$HOME"/Mail/Spam/Ham/"To Delete"
sa-learn --showdots --spam --dir "$HOME"/Mail/Spam/Spam/"To Delete"

