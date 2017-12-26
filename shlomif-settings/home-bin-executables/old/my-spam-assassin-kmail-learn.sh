#!/bin/bash

# The Expat License
#
# Copyright (c) 2017, Shlomi Fish
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
