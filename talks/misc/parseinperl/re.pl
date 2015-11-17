#! /usr/bin/perl
use Eirotic;
use re '/xms';

sub expr;
sub term;

sub term {
    m/ \G \s*
        (?: (?<val> \d+ )
        |   (?<var> [[:alpha:]]+ ))
    /gc  and return {%+};
    expr() // ()
}

sub expr {
    return unless
        m/ \G \s* \( (?<op> [-+*\/] )
         /cg;
    my @terms = $+{op};
    while ( my $t = term ) { push @terms, $t }
    m/ \G \s* \) /gc or die;
    \@terms;
}

sub parse {
    local $_ = shift;
    pos   $_ = 0;
    expr 
}

say YAML::Dump parse '(+ 12 x (- 1 3 ))';
