#!/usr/bin/env perl

use Test::More;
use File::Spec::Functions;
use FindBin qw/$Bin/;
use lib catfile($Bin, '../lib');

use Bowling;

my $file = catfile($Bin, '../data/test3.dat');

my $game = Bowling->new({ file => $file });

is $game->run, 28;

done_testing;
