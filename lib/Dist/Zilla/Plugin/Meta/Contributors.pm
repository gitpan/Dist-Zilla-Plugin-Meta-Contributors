use 5.008001;
use strict;
use warnings;

package Dist::Zilla::Plugin::Meta::Contributors;
# ABSTRACT: Generate an x_contributors section in distribution metadata
our $VERSION = '0.001'; # VERSION

use Moose;

has contributor => (
    is      => 'ro',
    isa     => 'ArrayRef[Str]',
    default => sub { [] },
);

sub mvp_multivalue_args { qw/contributor/ }

sub metadata {
    my $self = shift;
    if ( @{$self->contributor} ) {
        return { x_contributors => $self->contributor };
    }
    else {
        return {}
    }
}

with 'Dist::Zilla::Role::MetaProvider';

__PACKAGE__->meta->make_immutable;

1;


# vim: ts=4 sts=4 sw=4 et:

__END__

=pod

=head1 NAME

Dist::Zilla::Plugin::Meta::Contributors - Generate an x_contributors section in distribution metadata

=head1 VERSION

version 0.001

=head1 SYNOPSIS

  [Meta::Contributors]
  contributor = Wile E Coyote <coyote@example.com>
  contributor = Road Runner <fast@example.com>

=head1 DESCRIPTION

This module adds author names and email addresses to an C<x_contributors> section
of distribution metadata.

=for Pod::Coverage mvp_multivalue_args metadata

=head1 SEE ALSO

=over 4

=item *

L<Dist::Zilla::Plugin::ContributorsFromGit> -- automatic generation from git commit history

=back

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders metacpan

=head1 SUPPORT

=head2 Bugs / Feature Requests

Please report any bugs or feature requests through the issue tracker
at L<https://github.com/dagolden/dist-zilla-plugin-meta-contributors/issues>.
You will be notified automatically of any progress on your issue.

=head2 Source Code

This is open source software.  The code repository is available for
public review and contribution under the terms of the license.

L<https://github.com/dagolden/dist-zilla-plugin-meta-contributors>

  git clone git://github.com/dagolden/dist-zilla-plugin-meta-contributors.git

=head1 AUTHOR

David Golden <dagolden@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2013 by David Golden.

This is free software, licensed under:

  The Apache License, Version 2.0, January 2004

=cut
