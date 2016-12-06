# livescript tips

## a better deconstruction?

instead of having functions with a very long signature, lot of dynamic langages
provide some strategies to get named parameters. in livescript, you can do that
with deconstruction. so 

    ls = ( {path=".",recurse} = {} ) ->
        true

is compiled as

    var ls;
    ls = function(arg$){
      var ref$, path, ref1$, recurse;
      ref$ = arg$ != null
        ? arg$
        : {}, path = (ref1$ = ref$.path) != null ? ref1$ : ".", recurse = ref$.recurse;
      return true;
    };

the thing is ... what if 'null' is a value? it seems to me that deconstruction
should be transcripted using hasOwnProperty so

        path = (ref1$ = ref$.path) != null ? ref1$ : "."

should become

        path = ref1$.hasOwnProperty("path") ? ref1$.path : "."

