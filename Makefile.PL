use 5.008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'geo::ecef',
    VERSION_FROM      => 'lib/geo/ecef.pm', # finds $VERSION
    PREREQ_PM         => {Math::Big => 1.0, Math::BigFloat=> 1.0}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/geo/ecef.pm', # retrieve abstract from module
       AUTHOR         => 'Morten Sickel <morten@sickel.net>') : ()),
);
