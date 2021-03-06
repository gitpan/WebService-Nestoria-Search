
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.020.
use strict;
use warnings;



use ExtUtils::MakeMaker ;



my %WriteMakefileArgs = (
  "ABSTRACT" => "WebService::Nestoria::Search provides a Perl interface to the public API of Nestoria, a vertical search engine for property listings.",
  "AUTHOR" => "Alex Balhatchet (alex\@lokku.com)",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "WebService-Nestoria-Search",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "WebService::Nestoria::Search",
  "PREREQ_PM" => {
    "Carp" => 0,
    "HTTP::Request" => 0,
    "JSON" => "2.0",
    "LWP::UserAgent" => 0,
    "URI" => 0,
    "XML::Simple" => 0,
    "version" => 0
  },
  "TEST_REQUIRES" => {
    "List::MoreUtils" => 0,
    "Test::More" => 0,
    "Test::Warn" => 0
  },
  "VERSION" => "1.022006",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "HTTP::Request" => 0,
  "JSON" => "2.0",
  "LWP::UserAgent" => 0,
  "List::MoreUtils" => 0,
  "Test::More" => 0,
  "Test::Warn" => 0,
  "URI" => 0,
  "XML::Simple" => 0,
  "version" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



