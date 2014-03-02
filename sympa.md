% sympa

# github repo

i created my [github version of the sympa trunk](http://github.com/eiro.sympa)
with: 

    git svn clone -rHEAD http://svn.cru.fr/sympa/trunk sympa
    git remote add origin git@github.com:eiro/sympa.git
    git push -u origin master

and i sync it manually with 

    git svn rebase
    git push origin master


