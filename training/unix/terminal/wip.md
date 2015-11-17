# variables





# variables

    do=hello who=world
    msg="hello world"
    echo $do $who
    echo who are you
    read who
    echo hello $who

# hello world {.fragile}

\begin{block}{terminal}
\begin{zsh}
    <@\textbf{\color{red}PS1>}\keys{\return}@>
    <@\textbf{\color{red}PS1>}@> echo hello world <@\keys{\return}@>
    hello world
    <@\textbf{\color{red}PS1>}\keys{\ctrl + d}@>
\end{zsh}
\end{block}

| | | |
|-|-|-|
| echo   | hello | world |
| commande   | `$1`  | `$2`  |


| | |
|-|-|
| echo | hello\\ world |
| `$0` | `$1`    | 


| | |
|-|-|
| echo | "hello world" |
| `$0` | `$1` | 

zsh, vim
les outils de gestion de fichiers
les filtres (sed, awk, ....) 








