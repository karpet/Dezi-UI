package Dezi::UI;

use warnings;
use strict;
use base qw( Plack::Middleware );
use Carp;
use Plack::Request;
use Data::Dump qw( dump );

our $VERSION = '0.001000';

=head1 NAME

Dezi::UI - HTML interface to a Dezi server

=head1 SYNOPSIS

=cut

sub default_page {
    return <<EOF;
<html>
 <!-- based on http://www.extjs.com/deploy/dev/examples/form/custom.html -->
 <head>
  <title>Dezi UI</title>
  
  <script type="text/javascript"
          src="http://extjs.cachefly.net/ext-3.2.0/adapter/ext/ext-base.js"></script>
  <script type="text/javascript"
          src="http://extjs.cachefly.net/ext-3.2.0/ext-all.js"></script>
  <script type="text/javascript" 
          src="http://dezi.org/ui/example/ext-searchfield.js"></script>
  <script type="text/javascript"
          src="http://dezi.org/ui/example/ext-livegrid.js"></script>
  <script type="text/javascript"
          src="http://dezi.org/ui/livegrid/build/livegrid-all.js"></script>
  <link type="text/css" rel="stylesheet" 
        href="http://extjs.cachefly.net/ext-3.2.0/resources/css/ext-all.css" />         
  <link rel="stylesheet" type="text/css" 
        href="http://extjs.cachefly.net/ext-3.2.0/examples/form/combos.css" />
  <link rel="stylesheet" type="text/css" 
        href="http://extjs.cachefly.net/ext-3.2.0/examples/shared/examples.css" />
  <link rel="stylesheet" type="text/css" href="http://dezi.org/ui/example/ext-search.css" />
  <link rel="stylesheet" type="text/css" href="http://dezi.org/ui/livegrid/build/resources/css/ext-ux-livegrid.css" />
 </head>
 <body>
 <script type="text/javascript" src="http://extjs.cachefly.net/ext-3.2.0/examples/shared/examples.js"></script>
 <div style="width:700px;" id="search-panel"></div>
 </body>
</html>
EOF

}

sub call {
    my ( $self, $env ) = @_;
    my $req  = Plack::Request->new($env);
    my $path = $req->path;
    my $resp = $req->new_response;
    if ( $req->method eq 'GET' ) {
        $resp->content_type('text/html');
        $resp->body( $self->default_page );
    }
    else {
        $resp->status(400);
        $resp->body('GET only allowed');
    }
    return $resp;
}

1;

__END__

=head1 AUTHOR

Peter Karman, C<< <karman at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-dezi-ui at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dezi-UI>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dezi::UI

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dezi-UI>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Dezi-UI>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Dezi-UI>

=item * Search CPAN

L<http://search.cpan.org/dist/Dezi-UI/>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2012 Peter Karman.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
