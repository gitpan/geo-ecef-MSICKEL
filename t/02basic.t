#!/usr/bin/perl
use strict;
use warnings;

use Test::More tests=>20;
use blib;
use geo::ecef;


ok(Z(0,0,0)==0,'Z: 0,0,0');
ok(Z(0,90,0)==0,'Z: 0,90,0');
ok(Z(0,90,100)==0,'Z: 0,90,0');
ok(Z(90,0,0)==6356752.31424518,'Z: 90,0,0'); 
ok(Z(90,0,100)==6356852.31424518,'Z: 90,0,100');

ok(Y(90,0,0)==0,'Y: 90,0,0');
ok(Y(90,0,1000)==0,'Y: 90,0,1000');
ok(Y(0,90,0)==6378137.000,'Y(0,90,0)');
ok(Y(0,90,100)==6378237.000,'Y(0,90,100)');
ok(X(0,0,0)==6378137.000,'X(0,0,0)');
ok(X(0,0,100)==6378237.000,'X(0,0,100)');

my ($X,$Y,$Z)=( -742507.1,-5462738.5, 3196706.5);
my ($lat,$lon,$h)=(30.2746722,-97.7403306,0);
my $round=7;
#12-14
cmp_ok(X($lat,$lon,$h)->bround($round),'==', $X,'X');
$round++;
cmp_ok(Y($lat,$lon,$h)->bround($round),'==', $Y,'Y');
cmp_ok(Z($lat,$lon,$h)->bround($round),'==', $Z,'Z');

#($X,$Y,$Z)=(1109928,-4860097, 3965162);
($X,$Y,$Z)= (1110000,-4860000, 3960000);
$round=3;
# This rounding is too bad! Should not loose up to two extra decimals here?
($lat,$lon,$h)=(38.684,-77.150,0);
#15 - 17
cmp_ok(X($lat,$lon,$h)->bround($round),'==', $X,'X');
cmp_ok(Y($lat,$lon,$h)->bround($round),'==', $Y,'Y');
cmp_ok(Z($lat,$lon,$h)->bround($round),'==', $Z,'Z');


($X,$Y,$Z)= (-3014326.6,4039148.7, 3895863);
($lat,$lon,$h)=(37.89038,126.73316,23);
$round=8;
#18 - 20
cmp_ok(X($lat,$lon,$h)->bround($round),'==', $X,'X');
cmp_ok(Y($lat,$lon,$h)->bround($round),'==', $Y,'Y');
cmp_ok(Z($lat,$lon,$h)->bround($round),'==', $Z,'Z');
