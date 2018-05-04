#!/usr/bin/perl

use strict;
use warnings;

use File::Spec::Functions qw( catpath splitpath rel2abs );

# The Directory containing the script.
my $script_dir = catpath( ( splitpath( rel2abs $0 ) )[ 0, 1 ] );

my $db_base_name = "fortunes-shlomif-lookup.sqlite3";

use DBI;

use Shlomif::Homepage::FortuneCollections;

STDOUT->autoflush(1);

my $full_db_path = "$ENV{HOME}/Backup/Arcs/words-in-files.sqlite3";

# To reset the database.
# May not be a good idea in the future.
# unlink($full_db_path, "$full_db_path-journal");

my $dbh = DBI->connect( "dbi:SQLite:dbname=$full_db_path",
    "", "", { RaiseError => 1 } );

$dbh->begin_work;

$dbh->do("CREATE TABLE words (id INTEGER PRIMARY KEY ASC, w VARCHAR(255))");

$dbh->do("CREATE UNIQUE INDEX words_w ON words ( w )");

$dbh->do("CREATE TABLE files (id INTEGER PRIMARY KEY ASC, filename TEXT)");

$dbh->do("CREATE UNIQUE INDEX files_filenames ON files ( filename )");

my $insert_sth = $dbh->prepare(
"INSERT INTO fortune_cookies (collection_id, str_id, title, text) VALUES(?, ?, ?, ?)"
);

my $collections_aref = Shlomif::Homepage::FortuneCollections->sorted_fortunes();

{
    my $col_insert_sth = $dbh->prepare(<<'EOF');
INSERT INTO fortune_collections (str_id, title, tooltip, desc)
VALUES(?, ?, ?, ?)
EOF

    foreach my $col (@$collections_aref)
    {
        $col_insert_sth->execute( $col->id(), $col->text(), $col->title(),
            $col->desc() );
    }
}

my @file_bases = ( map { $_->id() } @$collections_aref );

my $collection_query_id_sth =
    $dbh->prepare(q{SELECT id FROM fortune_collections WHERE str_id = ?});

# We put the work within one large commit per the advice on
# Freenode's #perl by tm604 and jql , and to avoid these errors:
# http://stackoverflow.com/questions/21054245/attempt-to-write-a-readonly-database-django-w-selinux-error

my $global_idx = 0;

foreach my $basename (@file_bases)
{
    my $collection_id;

    my $rv = $collection_query_id_sth->execute($basename);

    if ( not( ($collection_id) = $collection_query_id_sth->fetchrow_array() ) )
    {
        die "Cannot find for '$basename'!";
    }

# my $tree = HTML::TreeBuilder::LibXML->new_from_file("./lib/fortunes/xhtmls/$basename.xhtml");
    my $tree = HTML::TreeBuilder::LibXML->new_from_file(
        "./lib/fortunes/xhtmls/$basename.compressed.xhtml");

    my $nodes_list = $tree->findnodes(q{//div[@class = "fortune"]});

    my $count = @$nodes_list;

    my $idx = 0;

    while ( defined( my $node = shift(@$nodes_list) ) )
    {
        printf( "%-70s\r", "$basename $idx/$count ($global_idx)" );

        my $h3_node = $node->findnodes(q{descendant::h3[@id]})->[0];

        my $id    = $h3_node->id;
        my $title = $h3_node->string_value();

        if ( !$id )
        {
            die "No ID in file '$basename' in " . $node->as_XML . "!";
        }

        $insert_sth->execute( $collection_id, $id, $title, $node->as_XML() );

        # Some debugging statement.
        # print "\n\n\n[[[START ID=$id]]]\n";
        # print $node->as_XML();
        # print "\n[[[END]]]\n\n\n";
    }
    continue
    {
        $idx++;

        $global_idx++;
    }
}

# Commit the remaining items.
$dbh->commit;

$insert_sth->finish;
$collection_query_id_sth->finish;

$dbh->disconnect;

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
