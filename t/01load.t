# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ecef.t'

#########################

# change 'tests => 4' to 'tests => last_test_to_print';

use Test::More tests => 5;
BEGIN { use_ok('geo::ecef') };
can_ok('geo::ecef','X');
can_ok('geo::ecef','Y');
can_ok('geo::ecef','Z');
can_ok('geo::ecef','p2dd');
#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

