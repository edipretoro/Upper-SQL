#!/usr/bin/env perl
use warnings;
use strict;

my @reserved= (
	       "insert", "values","into",
	       "create", "table", "select"
 );

my $filename = shift;
open my $fh, '<', $filename;

if ( <$fh> ) {
  foreach $_ ( @reserved ) {
    if ( $fh =~ qr/$_/ ) {
      $fh =~ s/($_)/\U$1\E/g;
      print "$fh\n";
    }
  }
}
else { print "Can't open file \n" ;}
