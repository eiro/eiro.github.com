# my patch on autocomplete

i need autocompletion in the project i work on so as we already use bootstrap3
and jquery, i chose to give
[devbridge's jquery autocomplete](https://www.devbridge.com/sourcery/components/jquery-autocomplete/)
a try. basic usage is damn simple: use the the jQuery autocomplete on a field
to set a completion up on it. there are a lot of settings available, the
result is pretty handsome and works well. as example

    $ !->
        $ \#user_login .autocomplete {
            serviceUrl: '/api/logins/'
            deferRequestBy: 500
            minChar: 3
        }

now, 500ms after the last key was pressed on the `user_login` field and if
there is more than 3 chars in it, `/api/logins?query=[the value of the field]`
will be contacted to return a list of suggestions.

if you want `/api/users?login=[the value of the field]` instead, just change
settings:

    $ !->
        $ \#user_login .autocomplete {
            serviceUrl: '/api/users/'
            paramName: 'login'
            deferRequestBy: 500
            minChar: 3
        }

if you want something more complicated based on more than one key (for example
by splitting informations contained in the field value up), i was missing
an entry point. so i just wrote
[this patch](https://github.com/eiro/jQuery-Autocomplete/commit/f7e87a09797b5eddd994a00cba46e32a2a674f04)
on my local copy.

i'm aware of an introduced bug i don't need to deal with for the moment: the
cacheKey can be inapproriate as it doesn't take care of the whole query.
for example

        $ \#id_delegate-user .autocomplete {
            serviceUrl: '/api/structures/'
            deferRequestBy: 250
            ajaxSetter: (q,settings) !->
                settings.data.structure = $ \#structure_id .value
        }


will only work if the value of the `structure_id` wasn't edited. there is more
than one way to adress this problem so i send my pull request as it for further
discussions about it.
