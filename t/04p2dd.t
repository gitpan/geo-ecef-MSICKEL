#!/usr/bin/perl
use strict;
use warnings;

use Test::More tests=>17;
use blib;
use geo::ecef;

is(p2dd('0 0 0'), 0, 'Null');
is(p2dd('90dN'), 90, '90N');
is(p2dd('90dS'), -90, '90S');
is(p2dd('45dN'), 45, '45N');
is(p2dd('45dS'), -45, '45S');
is(p2dd("45d30'N"), 45.5, '45.5N');
is(p2dd("45d30'S"), -45.5, '45.5S');
is(sprintf("%.7f", p2dd("45d30'30\"N")),  45.5083333, '45d30\'30"N');
is(sprintf("%.7f", p2dd("45d30'30\"S")), -45.5083333, '45d30\'30"S');
is(sprintf("%.7f", p2dd("45d30'30\"E")),  45.5083333, '45d30\'30"E');
is(sprintf("%.7f", p2dd("45d30'30\"W")), -45.5083333, '45d30\'30"W');
is(sprintf("%.7f", p2dd("45d30'30.50\"N")),  45.5084722, '45d30.50\'30"N');
is(sprintf("%.7f", p2dd("45d30'30.50\"S")), -45.5084722, '45d30.50\'30"S');

ok(not(defined(p2dd("45d60'N"))), '60 min');
ok(not(defined(p2dd("45d0'60\"N"))), '60 sek');
ok(not(defined(p2dd("45d70'N"))), '70 min');
ok(not(defined(p2dd("45d0'70\"N"))), '70 sek');

