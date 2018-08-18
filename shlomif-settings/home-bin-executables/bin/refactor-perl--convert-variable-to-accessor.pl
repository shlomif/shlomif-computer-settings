#!/usr/bin/perl

use strict;
use warnings;
use autodie;

package Refactor::Var2Slot;

sub new
{
    my $class = shift;

    my $self = bless {}, $class;

    $self->_init(@_);

    return $self;
}

sub _init
{
    my ( $self, $args ) = @_;

    return;
}

sub transform
{
    my ( $self, $args ) = @_;

    my $type     = $args->{type};
    my $var      = $args->{var};
    my $obj_name = $args->{obj_name} // 'self';

    my $code = ${ $args->{code} };

    if ( $type ne '@' )
    {
        die "Unknown type '$type'!";
    }

    $code =~
s#^(?P<start> *my \([^\n\)]*) \$\Q$var\E(?=[,\) ])(?P<end>[^\n\)]*\) = \@_; *)$# $+{start} . $+{end}
#egms;

    $code =~ s&(?P<start>\$\Q$obj_name\E->[a-zA-Z0-9_]+\([^\n\)]*?)
    \\?(?:\Q$type\E|\$)\Q$var\E(?=[,\) ])(?P<end>[^\n\)]*?\))
   &
   $+{start} . $+{end}
&egmsx;

    $code =~ s&^(?P<start>\ *)\Q$type\E\$?\Q$var\E\ =\ (?P<rval>[^;\n]+);$
   &
   $+{start} . "\$" . $obj_name . "->$var([" . $+{rval} ."]);"
&egmsx;

    my $slot = "\$" . $obj_name . "->$var";
    $code =~ s&\Q$type\E\$\Q$var\E\b
   &
   ($type eq '@') ? "\@{$slot}" : $slot
&egmsx;

    $code =~ s& \\ \Q$type\E \Q$var\E (?=[\ \n\t,;])
   &
   $slot
&egmsx;

    return +{ code => ( \$code ), };
}

package main;

my $obj_name = 'self';

my $var;
my $type;

use Getopt::Long;
use IO::All qw/ io /;

GetOptions(
    'obj-name=s' => \$obj_name,
    'var=s'      => \$var,
    'type=s'     => \$type,
) or die "$!";

my $code = io('-')->all;

print ${ Refactor::Var2Slot->new->transform(
        {
            obj_name => $obj_name,
            var      => $var,
            type     => $type,
            code     => \$code
        }
    )->{code}
};

__END__

=head1 COPYRIGHT & LICENSE

Copyright 2018 by Shlomi Fish

This program is distributed under the MIT / Expat License:
L<http://www.opensource.org/licenses/mit-license.php>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

=cut
