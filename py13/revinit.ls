# Full list of configuration options available here:
# https://github.com/hakimel/reveal.js#configuration


Reveal.initialize {
    +control, +progress, +history, +center
    , theme: \sky # pick one: reveal.js/css/theme/
    , transition: \default # default/cube/page/concave/zoom/linear/fade/none
    , dependencies: 
        * src: \reveal.js/lib/js/classList.js
          condition: -> !document.body.classList
          async: true
        * src: \reveal.js/lib/js/classList.js
          condition: -> !document.body.classList
          async: true
        * src: \reveal.js/plugin/highlight/highlight.js
          condition: -> !document.body.classList
          async: true
}


