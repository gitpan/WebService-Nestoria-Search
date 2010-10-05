
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'WebService::Nestoria::Search provides a Perl interface to the public API of Nestoria, a vertical search engine for property listings.',
  'AUTHOR' => 'Alex Balhatchet (alex@lokku.com)',
  'BUILD_REQUIRES' => {
    'List::MoreUtils' => '0',
    'Test::More' => '0',
    'Test::Warn' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'WebService-Nestoria-Search',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'WebService::Nestoria::Search',
  'PREREQ_PM' => {
    'Carp' => '0',
    'HTTP::Request' => '0',
    'JSON' => '2.0',
    'LWP::UserAgent' => '0',
    'URI' => '0',
    'XML::Simple' => '0',
    'version' => '0'
  },
  'VERSION' => '1.018001',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



