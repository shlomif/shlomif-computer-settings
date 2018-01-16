# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

use v6;

{
    my %h;
    for @*ARGS -> $f
    {
        for $f.IO.lines.kv -> $i , $l
        {
            for $l ~~ m:P5:g/(\w+)/ -> $k
            {
                (%h{$k} ||= []).push("{$f}:{$i+1}");
            }
        }
    }


    for (%h.keys.sort: { %h{$^a}.elems <=> %h{$^b}.elems or $^a leg $^b }) -> $w
    {
        .say for %h{$w}.map: { "{$_}:$w"}
    }
}
