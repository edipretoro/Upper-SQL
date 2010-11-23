#!/usr/bin/env perl
use warnings;
use strict;

my @reserved = qw(
		   insert values into
		   create table select
		);

my $filename = shift;
open my $fh, '>', $filename
  or die "Can't open file : $!\n";

my @lines;

while (my $lines = <$fh>) {
  push(@lines, $lines);
  $lines =~ s/.*//g;
}

foreach my $line (@lines) {
  foreach $_ (@reserved) {
    if ($line =~ qr/$_/) {
      $line =~ s/\b($_)\b/\U$1\E/g;
    } else {
      next;
    }
  }
  print $fh "$line";
}

