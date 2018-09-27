---
vim: et ts=2 sts=2 sw=2
title: Personal notes about sympa
keywords: sympa perl code
author: Marc Chantreux <marc.chantreux@renater.fr>
---

# confortable sympa hacking

those are ideas, make them yours.

## setup your env

in your `~/.zshenv`

  # code 3 times faster ;)
  g () git "$@"
  z () zsh "$@"

  # make vim file navigation will work

  export -UT PERL5LIB perl5lib
  perl5lib+=src/lib

shorten the path to sympa repos

  g config --global 'url.git@github.com:sympa-community/.insteadOf' sympa:

## clone sympa project

  g clone sympa:sympa
  cd sympa
  ctags -R # vim :h :tag

# create a basic Sympa::Constants

this shouldn't be required during the tests

  automake --add-missing
  autoreconf
  ./configure
  make

# installing perl deps (debian)

this [debian control file](sympa-deps-control)
was created by removing the server components
from the official sympa debian package. to use it

  equivs-build sympa-deps-control
  apt install ./*deb

now you have a sympa-deps package installed so

  aptitude search '~Ddepends:libmime-encwords-perl'

  p  sympa - gestionnaire moderne de listes de diffusion
  i  sympa-deps - Modern mailing list manager

voilà :)

# vim recommended extension

ctrlp and futigitive


