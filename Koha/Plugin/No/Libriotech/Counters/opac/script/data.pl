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
use CGI qw( -utf8 );
use JSON qw( to_json );

use C4::Context;
our $dbh = C4::Context->dbh;

binmode STDOUT, ":encoding(UTF-8)";

my $input = new CGI;
print $input->header( -type => 'text/plain', -charset => 'UTF-8' );

my %data = (
    'loans'    => _count_loans(),
    'searches' => _count_searches(),
);

print to_json(\%data);

sub _count_searches {

    my $query = "SELECT COUNT(*) FROM search_history";
    my $sth = $dbh->prepare($query);
    $sth->execute();
    my ($count) = $sth->fetchrow_array();
    return $count;

}

sub _count_loans {

    my $query = "SELECT COUNT(*) FROM ( SELECT issue_id FROM issues UNION SELECT issue_id FROM old_issues ) AS x";
    my $sth = $dbh->prepare($query);
    $sth->execute();
    my ($count) = $sth->fetchrow_array();
    return $count;

}
