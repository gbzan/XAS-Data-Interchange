#!/usr/bin/perl  -I../../blib/lib -I../../blib/arch

## bad file coverage test

use Test::More tests => 1;

use strict;
use warnings;
use File::Basename;
use File::Spec;

my $here = dirname($0);
my $file = File::Spec->catfile($here, 'coverage.txt');


my $text;
{
  local $/;
  open(my $COV, '<', 'coverage.txt');
  $text = <$COV>;
  close $COV;
};

my @list = sort {$a <=> $b} split(" ", $text);
my @all = (1 .. 29);

ok($#list eq $#all, sprintf('tested %d of %d bad files (%s)',
			    $#list+1, $#all+1, join(",", @list)));
unlink 'coverage.txt';
