# this is a test 

use v6; 

sub foo (|haha) {
    haha.perl.say
}

foo :12x, :15y, < this is a shock >, "this", "blows my mind"

# class User {
#     has $.name;
#     sub new(|) {
#     }
# }

# class Group {
# 
#     sub infix:<enlist> (User) {
#     }
# }
# 
