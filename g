#! /usr/bin/zsh

g s |
    awk '!( /^?/ || /\.(xml|html|css)$/ )' |
    vim - +'setf gitss'
