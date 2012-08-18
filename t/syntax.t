#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use lib 't/lib';

use Try;

my $err;

try {
    require Error1;
}
catch {
    $err = $_;
}
like(
    $err,
    qr/Can't call method "finallyy" without a package or object reference at /,
);

try {
    require Error2;
}
catch {
    $err = $_;
}
like(
    $err,
    qr/Can't call method "catch" without a package or object reference at /,
);

done_testing;
