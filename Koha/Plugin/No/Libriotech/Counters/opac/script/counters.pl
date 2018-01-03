#!/usr/bin/perl

# Copyright 2018 Magnus Enger Libriotech
#
# This is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation; either version 3 of the License, or (at your option) any later
# version.
#
# This is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

use Modern::Perl;

use CGI qw ( -utf8 );

use C4::Auth;
use C4::Biblio;
use C4::Context;
use C4::Koha;
use C4::Output;
use Koha::Patrons;
use URI::Escape;

use Data::Dumper; # FIXME Debug

my $cgi = CGI->new();
my ( $template, $borrowernumber, $cookie ) = get_template_and_user(
    {
        template_name   => 'counters.tt',
        query           => $cgi,
        type            => 'opac',
        authnotrequired => 1,
    }
);

my $query        = $cgi->param('query_value');
my $here         = "/counters.pl";

$template->param(
    value1 => 1,
    value2 => 2,
);

output_html_with_http_headers( $cgi, $cookie, $template->output );
