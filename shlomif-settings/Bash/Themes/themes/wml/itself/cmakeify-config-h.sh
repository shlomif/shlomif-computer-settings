#!/bin/bash
cat "$1" | perl -lne 's{^#undef HAVE_([A-Z_]+_H)\s*$}{$1} && print' | tr A-Z a-z | perl -pe 's{_h$}{.h}' | tr _ / | klip
