#! /usr/bin/perl
use Modern::Perl;
use URI::Encode 'uri_encode';

# don't spam me, bot! 
my $MAIL_TO_MY_LIST = 
'mailto:'
. 'blog-comment-experiment'
. '@'
. 'u-strasbg.fr?';

sub comment {
    my ( $header ) = map {
        s/[^a-zA-Z0-9]//g;
        uri_encode "<$_\@eiro.github.io>";
    } shift;
    my ( $title ) = map {uri_encode "Re: $_"} shift; 

    $MAIL_TO_MY_LIST
    . "In-Reply-To=$header"
    . "&Subject=$title"

}



# $^I ='';
# while (<>) {
#     print;
#     if (/^#[^#]\S+ (.*)/) {
#         printf q!<a href="%s">Comment</a>\n!, comment $_, $1;
#         # mailto:mutt-po-request@mutt.org?Body=toto%20haha%0Atata&Cc=toto&Subject=Subscribe%20Mutt%20Translators
#     }
# }
