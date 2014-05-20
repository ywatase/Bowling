#!/usr/bin/env perl

use Test::More;
use File::Spec::Functions;
use FindBin qw/$Bin/;
use lib catfile($Bin, '../lib');

BEGIN {
    use_ok('Bowling');
};

done_testing;
