use strict;
use warnings;

use Test::More;
use English qw(-no_match_vars);

my $msg;

if (!$ENV{'WNS_DO_PERL_CRITIC'}) {
    $msg = 'Test::Perl::Critic skipped: set "WNS_DO_PERL_CRITIC" env variable to enable'
}
elsif ($ENV{'PERLCRITIC'}) {
    $msg = 'Test::Perl::Critic skipped: ENV defines custom .perlcriticrc';
}
elsif (-f "$ENV{HOME}/.perlcriticrc") {
    $msg = 'Test::Perl::Critic skipped: ~/.perlcriticrc found, do not want';
}
else {
    eval { require Test::Perl::Critic };
    if ($EVAL_ERROR) {
        $msg = 'Test::Perl::Critic required to criticise code';
    }
}


if ($msg) {
    plan(skip_all => $msg);
    exit;
}
else {
    Test::Perl::Critic->import;
    all_critic_ok();
}
