#!/usr/bin/perl -w

use strict;

my $data_dir = "$ENV{HOME}/.kde/share/apps/kabc";
my $dist_list_name = q{"Beta Readers" Distribution List};
open I, "<$data_dir/distlists";
my $found = 0;
my $members_string;
while(<I>)
{
    if (/^$dist_list_name=(.*),/)
    {
        $members_string = $1;
        $found = 1;
        last;
    }
}
close(I);
if (!$found)
{
    die "Could not find $dist_list_name";
}
my @members = split(/,,/, $members_string);
# print map { "$_\n" } @members;
my %emails = (map { $_ => undef } @members);

sub get_line
{
    $_ = <I>;
    if (!defined($_))
    {
        return undef;
    }
    s{\r?\n?$}{};
    return $_;
}
open I, "<$data_dir/std.vcf";
while (defined(get_line()))
{
    if (/^BEGIN:VCARD$/)
    {
        my ($uid, $email);
        UID_LOOP: while (defined(get_line()))
        {
            if (/^END:VCARD$/)
            {
                if (!defined ($uid))
                {
                    die "Error uid not defined at line $.\n";
                }
                if (exists($emails{$uid}))
                {
                    if (!defined ($email)) 
                    { 
                        die "Error email not defined for UID $uid\n"; 
                    }
                    elsif (defined($emails{$uid}))
                    {
                        die "Duplicate Entry for ID $uid!\n";
                    }
                    else
                    {
                        $emails{$uid} = $email;
                    }
                }
                last UID_LOOP;
            }
            elsif (/^EMAIL;TYPE=PREF:(.*)$/)
            {
                if (defined ($email))
                {
                    die "Duplicate E-mail at line $.!\n";
                }
                else
                {
                    $email = $1;
                }
            }
            elsif (/^UID:(.*)$/)
            {
                if (defined ($uid))
                {
                    die "Duplicate UID at line $.!\n";
                }
                else
                {
                    $uid = $1;
                }
            }
        }
    }
}
close(I);

my $output = "";
foreach my $m (@members)
{
    if (defined($emails{$m}))
    {
        $output .= $emails{$m} . "\n";
    }
    else
    {
        die "Missing E-mail for UID $m!\n";
    }
}
print $output;

