## yarn and livescript

i don't want to write js code. so waiting for 
[a js backend for perl6](https://github.com/rurban/rakudo-js) or
[elm](http://elm-lang.org/) to be stable enough, i use
[livescript](http://livescript.net/).

i tried npm to install it but it's broken on debian sid, so i
installed yarn [on those instructions](https://yarnpkg.com/en/docs/install).

the "alternative install" described there is broken because 'eslint-rules' is
missing. i gave up without trying to fix as the debian repo works with sid:

    sudo apt-key adv --keyserver pgp.mit.edu --recv D101F7899D41F3C3
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list"
    apt update
    apt install yarn

be sure `~/node_modules/.bin` in your `$path` then

    yarn add Livescript
    rehash # if needed

et voilà ... lsc is available. now you can use lsc, options i use are
`--no-header -bcp`.

please don't use `-w` which is just yet another stupid idea from javasript
world 

because javascript isn't the only technology you want to avoid, you will quickly consider
other wrappers like [pugs](https://pugjs.org/), [stylus](http://stylus-lang.com/), [markdown using
pandoc](http://pandoc.org/) so please don't use `--watch` which is just another
bad idea from the web world. consider
[GNU make](https://www.gnu.org/software/make/),
[9base mk](http://tools.suckless.org/9base) or
[django-static-precompiler](https://pypi.python.org/pypi/django-static-precompiler)
if you're using django. an example of [makefile from a djangonaute](https://github.com/dotmobo/tools/blob/master/myboilerplate/Makefile)
or even [my own one](https://github.com/eiro/eiro.github.com/blob/master/Makefile).

# websockets made easy ?

today, i had a usecase to test websockets at work, i was aware of
[websocketd](http://websocketd.com/) but googled anyway.

in this
[reddit thread](https://www.reddit.com/r/programming/comments/441r94/webpipe_command_line_utility_for_piping_tofrom_a/),
i discovered [webpipe](https://github.com/emgram769/webpipe)
which is like socat/netcat of websockets where websocketd is more like inetd.

i just installed it

    sudo aptitude install libwebsockets-dev &&
        make TARGET=~/bin/webpipe

now need to play, now 

