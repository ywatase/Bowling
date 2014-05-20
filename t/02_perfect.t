#!/usr/bin/env perl

use Test::More;
use File::Spec::Functions;
use FindBin qw/$Bin/;
use lib catfile($Bin, '../lib');

use Bowling;

my $file = catfile($Bin, '../data/perfect.dat');

my $game = Bowling->new({ file => $file });

is $game->run, 300;

done_testing;
