#! /usr/bin/env pike

constant address = "http://www.advogato.org/XMLRPC";

int main( int argc, array(string) argv )
{
  Protocols.XMLRPC.Client client = Protocols.XMLRPC.Client( address );
  for( int i=1; i<argc; i++ )
    mirror( argv[i], client );
}

int mirror( string user, Protocols.XMLRPC.Client client )
{
  Calendar.TimeRange ctime, mtime;
  int entries, i;
  string html, filename;
  [entries] = client["diary.len"]( user );
  for( i=0; i<entries; i++ )
  {
    [[ctime, mtime]] = client["diary.getDates"]( user, i );
    [html] = client["diary.get"]( user, i);
    string filename = user + "." + i + ".txt";
    Stdio.write_file( filename, html + "\n" + ctime->format_time() );
    System.utime( filename, ctime->unix_time(), mtime->unix_time() );
  }
  return entries;
}
