---
title: interactive perlude
tags: shell perl perlude cli
layout: post
---
{% include JB/setup %}

# oh yeah 

this is a basic example 

{{ highlight perl }}
    use Perlude;
    use Perlude::Sh ':all';
    now {say} ls "*";
{{ endhighlight }}
