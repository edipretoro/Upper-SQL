#!/usr/bin/env perl
use warnings;
use strict;

my @list = ('a','b','c');

my $text = "sddadzaxbsa&xdésxh a zdezcaab";

foreach $_ (@list) {
  if ( $text =~ qr/$_/ ) {
    $text =~ s/($_)/\U$1\E/g;
  }
}

print "$text\n";
