package Try;
use strict;
use warnings;
# ABSTRACT: nicer exception handling syntax

use Devel::CallParser;
use XSLoader;

XSLoader::load(
    __PACKAGE__,
    exists $Try::{VERSION} ? ${ $Try::{VERSION} } : (),
);

use Exporter 'import';
our @EXPORT = ('try');

use Try::Tiny ();

sub try {
    my ($try, $catch, $finally) = @_;
    &Try::Tiny::try(
        $try,
        ($catch   ? (&Try::Tiny::catch($catch))     : ()),
        ($finally ? (&Try::Tiny::finally($finally)) : ()),
    );
}

1;
