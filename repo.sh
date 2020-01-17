echo $1
blih -u jonathan.gomez@epitech.eu repository create $1
blih -u jonathan.gomez@epitech.eu repository setacl $1 ramassage-tek r
git clone git@git.epitech.eu:/jonathan.gomez@epitech.eu/$1
