#!/usr/bin/env perl
use warnings;
use strict;

my @reserved= qw(
	       insert values into
	       create table select
 );

my $filename = shift;
open my $fh, '<', $filename
  or die "Can't open file : $!\n";

# open my $out, '>', $filename
#   or die "Can't open output file : $!\n";

my $i=0;

# while (<$fh>) {
#   foreach my $reserved (@reserved) {
#     if ($fh =~ qr/$reserved/) {
#       $fh =~ s/($reserved)/\U$1\E/;
#       $i++;
#       next;
#     }
#     else {next;}
#   }
#}

while (my $line = <$fh>) {
  foreach $_ (@reserved) {
    if ($line =~ qr/$_/) {
      $i++;
      $line=~ s/($_)/\U$1\E/g;
      print "$line $/";
    } else { print "$line $/"; }
  }
}
# print "$i $/";
# print "All done !\n";

