#! /usr/bin/perl
use Eirotic;
use TAP::Parser;

sub tap_results ($file) {
    my $parser = TAP::Parser->new({ tap => $file });
    my $e;
    sub {
        return $e while $e = $parser->next;
        ()
    }
}

sub summary {
    map {$_->is_ok ? '+' : '-'}
    fold filter {$_->is_test}
    shift
}

say summary tap_results "t/macros.tap";
