#!/usr/bin/perl
use strict;
use warnings;

use Test::More tests=>9;
use blib;
use geo::ecef;

# This is really cheating a bit, since _checkdeg is not supposed to 
# be called from outside the ecef package, but to check for carps, a non-
# standard package Test::Warn needs to be present, so I would rather keep it
# like this than to add an extra dependency


isnt(defined(geo::ecef::_checkdeg(0,0)), 'No Error');
isnt(defined(geo::ecef::_checkdeg(90,0)), 'No Error');
isnt(defined(geo::ecef::_checkdeg(-90,0)), 'No Error');
isnt(defined(geo::ecef::_checkdeg(0,-180)), 'No Error');
isnt(defined(geo::ecef::_checkdeg(0,180)), 'No Error');
ok(geo::ecef::_checkdeg(90.1,0)   =~ m/latitude/, 'Invalid latitude');
ok(geo::ecef::_checkdeg(0,180.1)  =~ m/longitude/, 'Invalid longitude');
ok(geo::ecef::_checkdeg(-90.1,0)  =~ m/latitude/, 'Invalid latitude');
ok(geo::ecef::_checkdeg(0,-180.1) =~ m/longitude/, 'Invalid longitude');




