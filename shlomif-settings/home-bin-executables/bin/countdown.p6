use v6;

sub MAIN($delay)
{
    my $start = now;
    my $end = $start + $delay;

    my $last_printed;
    while (my $t = now) < $end
    {
        my $new_to_print = ($end - $t).floor;
        # say $new_to_print;
        if !defined($last_printed) or $new_to_print != $last_printed
        {
            $last_printed = $new_to_print;
            print "Remaining {$new_to_print.fmt('%i')}/{$delay}{' ' x 40}\r";
            $*OUT.flush;
        }
        sleep(0.3);
    }
}
