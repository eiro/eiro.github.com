% A strange bug in Scrappy (or Moose?)

Years ago, i wrote a script using Scrappy. this script randomly failed but i
didn't pay attention because it was on a cron table so it also randomly worked.

Now i tried to fix the things and i'm confused: I found that the `Scrappy::Plugin`
, that walks in a directory to find files, randomly returns `undef`. 

As the files are or aren't there, there is no way for me to return a random answer
(which, reading the code of the module, must never happen as the defaut result
is an empty ArrayRef).

I modified the `Scappy::Plugin` accessor `registry` which invoked the unreliable
accessor to return a real error

    # a hash list of installed plugins
    has qw( registry is ro isa HasRef )
    , default => sub {
            my $r = shift;
            +{ map +( $_ => $_, (lc $_ ) => $_ ),
                @{ $r->plugins // confess "something went wrong with $r plugins" } };
        }
    );

then i can see that forcing no plugin to be loaded works

    repeat 10 { print "test $[test++]"; perl -MScrappy -E'Scrappy->new( plugins => [])' } 

        test 0
        test 1
        test 2
        test 3
        test 4
        test 5
        test 6
        test 7
        test 8
        test 9

But out of curiosity, can even give me a clue to debug this ???

    repeat 10 { print "test $[test++]"; perl -MScrappy -E'Scrappy->new' }

    test 0
    something went wrong with Scrappy::Plugin=HASH(0x38bdaa8) plugins at /home/mc/perl5/lib/perl5/Scrappy/Plugin.pm line 19.
            Scrappy::Plugin::__ANON__(Scrappy::Plugin=HASH(0x38bdaa8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x29357d8), Scrappy::Plugin=HASH(0x38bdaa8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x29357d8), Moose::Meta::Instance=HASH(0x2103fb8), Scrappy::Plugin=HASH(0x38bdaa8), HASH(0xfecf80)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x1f49140), HASH(0xfecf80)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x1f49140), HASH(0xfecf80)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x1f49140), HASH(0xfecf80)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy::Plugin") called at /home/mc/perl5/lib/perl5/Scrappy/Scraper.pm line 70
            Scrappy::Scraper::__ANON__(Scrappy=HASH(0x100ac50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x3966b78), Scrappy=HASH(0x100ac50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x3966b78), Moose::Meta::Instance=HASH(0x100ad40), Scrappy=HASH(0x100ac50), HASH(0x100ab48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x1023d88), HASH(0x100ab48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x1023d88), HASH(0x100ab48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x1023d88), HASH(0x100ab48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy") called at -e line 1
    test 1
    something went wrong with Scrappy::Plugin=HASH(0x2308de0) plugins at /home/mc/perl5/lib/perl5/Scrappy/Plugin.pm line 19.
            Scrappy::Plugin::__ANON__(Scrappy::Plugin=HASH(0x2308de0)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x3c1d468), Scrappy::Plugin=HASH(0x2308de0)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x3c1d468), Moose::Meta::Instance=HASH(0x3abca30), Scrappy::Plugin=HASH(0x2308de0), HASH(0x2308dc8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x3aaf620), HASH(0x2308dc8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x3aaf620), HASH(0x2308dc8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x3aaf620), HASH(0x2308dc8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy::Plugin") called at /home/mc/perl5/lib/perl5/Scrappy/Scraper.pm line 70
            Scrappy::Scraper::__ANON__(Scrappy=HASH(0x22f2c50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x4c4e518), Scrappy=HASH(0x22f2c50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x4c4e518), Moose::Meta::Instance=HASH(0x22f2d40), Scrappy=HASH(0x22f2c50), HASH(0x22f2b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x230bd58), HASH(0x22f2b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x230bd58), HASH(0x22f2b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x230bd58), HASH(0x22f2b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy") called at -e line 1
    test 2
    something went wrong with Scrappy::Plugin=HASH(0x18ba588) plugins at /home/mc/perl5/lib/perl5/Scrappy/Plugin.pm line 19.
            Scrappy::Plugin::__ANON__(Scrappy::Plugin=HASH(0x18ba588)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x31cf5c8), Scrappy::Plugin=HASH(0x18ba588)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x31cf5c8), Moose::Meta::Instance=HASH(0x306e9d8), Scrappy::Plugin=HASH(0x18ba588), HASH(0x18ba528)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x27e2e20), HASH(0x18ba528)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x27e2e20), HASH(0x18ba528)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x27e2e20), HASH(0x18ba528)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy::Plugin") called at /home/mc/perl5/lib/perl5/Scrappy/Scraper.pm line 70
            Scrappy::Scraper::__ANON__(Scrappy=HASH(0x18a4c50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x42009d8), Scrappy=HASH(0x18a4c50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x42009d8), Moose::Meta::Instance=HASH(0x18a4d40), Scrappy=HASH(0x18a4c50), HASH(0x18a4b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x18bdd58), HASH(0x18a4b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x18bdd58), HASH(0x18a4b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x18bdd58), HASH(0x18a4b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy") called at -e line 1
    test 3
    test 4
    test 5
    test 6
    test 7
    something went wrong with Scrappy::Plugin=HASH(0x43b7520) plugins at /home/mc/perl5/lib/perl5/Scrappy/Plugin.pm line 19.
            Scrappy::Plugin::__ANON__(Scrappy::Plugin=HASH(0x43b7520)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x32b4428), Scrappy::Plugin=HASH(0x43b7520)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x32b4428), Moose::Meta::Instance=HASH(0x3153c08), Scrappy::Plugin=HASH(0x43b7520), HASH(0x43ba9b0)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x29b6518), HASH(0x43ba9b0)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x29b6518), HASH(0x43ba9b0)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x29b6518), HASH(0x43ba9b0)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy::Plugin") called at /home/mc/perl5/lib/perl5/Scrappy/Scraper.pm line 70
            Scrappy::Scraper::__ANON__(Scrappy=HASH(0x1989c50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x42e55f0), Scrappy=HASH(0x1989c50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x42e55f0), Moose::Meta::Instance=HASH(0x1989d40), Scrappy=HASH(0x1989c50), HASH(0x1989b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x19a2d70), HASH(0x1989b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x19a2d70), HASH(0x1989b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x19a2d70), HASH(0x1989b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy") called at -e line 1
    test 8
    test 9
    something went wrong with Scrappy::Plugin=HASH(0x43e3ef8) plugins at /home/mc/perl5/lib/perl5/Scrappy/Plugin.pm line 19.
            Scrappy::Plugin::__ANON__(Scrappy::Plugin=HASH(0x43e3ef8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x345b888), Scrappy::Plugin=HASH(0x43e3ef8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x345b888), Moose::Meta::Instance=HASH(0x32fb100), Scrappy::Plugin=HASH(0x43e3ef8), HASH(0x1b39dd8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x2a6ece8), HASH(0x1b39dd8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x2a6ece8), HASH(0x1b39dd8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x2a6ece8), HASH(0x1b39dd8)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy::Plugin") called at /home/mc/perl5/lib/perl5/Scrappy/Scraper.pm line 70
            Scrappy::Scraper::__ANON__(Scrappy=HASH(0x1b30c50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Mixin/AttributeCore.pm line 44
            Class::MOP::Mixin::AttributeCore::default(Moose::Meta::Attribute=HASH(0x448cd98), Scrappy=HASH(0x1b30c50)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Attribute.pm line 501
            Moose::Meta::Attribute::initialize_instance_slot(Moose::Meta::Attribute=HASH(0x448cd98), Moose::Meta::Instance=HASH(0x1b30d40), Scrappy=HASH(0x1b30c50), HASH(0x1b30b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 526
            Class::MOP::Class::_construct_instance(Moose::Meta::Class=HASH(0x1b49d10), HASH(0x1b30b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Class/MOP/Class.pm line 496
            Class::MOP::Class::new_object(Moose::Meta::Class=HASH(0x1b49d10), HASH(0x1b30b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Meta/Class.pm line 274
            Moose::Meta::Class::new_object(Moose::Meta::Class=HASH(0x1b49d10), HASH(0x1b30b48)) called at /home/mc/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Moose/Object.pm line 24
            Moose::Object::new("Scrappy") called at -e line 1

