use strict;
use warnings;

use Test::More;
use Test::Warn;
use List::MoreUtils qw(apply);
use WebService::Nestoria::Search Warnings => 1;

##########################################################################
## require internet connection
##
if (! WebService::Nestoria::Search->test_connection) {
    plan 'skip_all' => 'test requires internet connection';
    exit 0;
}

##########################################################################
## plan
##
plan tests => 34;
my ($ns, $result);

##########################################################################
## create WebService::Nestoria::Search::Result object
##
$ns = WebService::Nestoria::Search->new(
    'country'           => 'de',
    'encoding'          => 'json',
    'number_of_results' => 10,
);
ok($ns && ref($ns), 'created WebService::Nestoria::Search object');

my @results = $ns->results('place_name' => 'koeln');
$result = $results[0];
ok(
    $result && ref($result),
    'created WebService::Nestoria::Search::Result object'
);

##########################################################################
## get_hashref
##
my $listing_data = $result->get_hashref;
is(
    ref($listing_data),
    'HASH',
    'got listing hash reference'
);
ok($listing_data->{'title'}, 'got listing title directly from hash reference');

##########################################################################
## get_*
##
my @fields = qw(
    latitude
    longitude
    listing_type
    property_type
    datasource_name
    lister_name
    lister_url
    price
    price_type
    price_currency
    price_formatted
    title
    summary
    bedroom_number
    bathroom_number
    room_number
    size
    size_unit
    thumb_url
    thumb_height
    thumb_width
    img_url
    img_height
    img_width
    keywords
    guid
    commission
    construction_year
    updated_in_days
    updated_in_days_formatted
);

foreach my $field (@fields) {
    my $func = "get_$field";
    eval { $result->$func() };
    ok !$@, "called $func";
}
