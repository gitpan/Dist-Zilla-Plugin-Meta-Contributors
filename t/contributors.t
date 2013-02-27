use 5.006;
use strict;
use warnings;
use Test::More 0.96;

use Test::DZil;

my @CONTRIBUTORS = (
    'Wile E Coyote <coyote@example.com>',
    'Road Runner <fast@example.com>',
);

{
    my $tzil = Dist::Zilla::Tester->from_config(
        { dist_root => 'corpus/DZ' },
    );
    ok($tzil, "created test dist");

    $tzil->build;

    is_deeply( $tzil->distmeta->{x_contributors}, \@CONTRIBUTORS, "x_contributors correct" );
}

{
    my $tzil = Dist::Zilla::Tester->from_config(
        { dist_root => 'corpus/DZ-empty' },
    );
    ok($tzil, "created test dist");

    $tzil->build;

    is_deeply( $tzil->distmeta->{x_contributors}, undef, "x_contributors not generated if empty" );
}

done_testing;
#
# This file is part of Dist-Zilla-Plugin-Meta-Contributors
#
# This software is Copyright (c) 2013 by David Golden.
#
# This is free software, licensed under:
#
#   The Apache License, Version 2.0, January 2004
#
