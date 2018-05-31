# hiding the web stack

## javascript

* [a  WIP js backend for perl6](https://github.com/rurban/rakudo-js)
* [elm](http://elm-lang.org/)
* [livescript](http://livescript.net/) with `--no-header -bcp`

# html and css

* [pugs](https://pugjs.org/)
* [stylus](http://stylus-lang.com/)
* [markdown using pandoc](http://pandoc.org/)

# put it all together

* [GNU make](https://www.gnu.org/software/make/)
* [9base mk](http://tools.suckless.org/9base)

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

now need to play, now.  [this mojolicious gist](https://gist.github.com/jberger/4744482)
is interesting as well as it shows the implementation of a client-side part. 

# a voir

* implementation light des  webcomponents?
  [skate](https://github.com/skatejs/skatejs)

* [redux](...)
  * sandhose dit "ca fait ce que tu veux, ca fait 200 lignes et c'est une réécriture de flux"
  * mobo dit "c'est inspiré par elm"

# do not html !!!

* hard to write and maintain
* don't tell you when you brake the tree
* produce spaced html

## debug rendered

* from vim

    .!xmlstarlet fo -H -o -D


