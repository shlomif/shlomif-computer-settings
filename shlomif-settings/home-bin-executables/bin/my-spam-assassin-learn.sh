#!/usr/bin/env bash
process_dir()
{
    local mytype="$1"
    shift
    local dir="$1"
    shift
    sa-learn --showdots "$mytype" --dir "$dir"
    # mv "$dir"/Received/cur/* "$dir"/Saved/cur/
    local t=learn_spam
    if test "$mytype" = "--ham"
    then
        t=learn_ham
    fi
    # Reenabling again because it has become faster.
    if true
    then
        rspamc -v "$t" "$dir"
    fi
}
process_dir --spam "$HOME/Mail/Spam/Spam/Received"
process_dir --spam "$HOME/Mail/Spam/Uncaught/Received"
process_dir --ham "$HOME/Mail/Spam/Ham/Received"
process_dir --ham "$HOME/Mail/Spam/Ham/To Delete"
process_dir --spam "$HOME/Mail/Spam/Spam/To Delete"


# The Expat License
#
# Copyright (c) 2018, Shlomi Fish
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
