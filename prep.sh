#! /bin/bash

 if [ -z $1 ]
 then echo "USAGE:  prep [EXECUTABLE_NAME]"
      exit 84
 fi

mkdir -p src
mkdir -p include

function put_header() {
    if [ "$2" == "M" ]; then
        echo "##" > $1
        echo "## EPITECH PROJECT, 2019" >> $1
        echo "## "$(basename $PWD) >> $1
        echo "## File description:" >> $1
        echo "## "$1 >> $1
        echo -e "##\n" >> $1
    else
        echo "/*" > $1
        echo "** EPITECH PROJECT, 2019" >> $1
        echo "** "$(basename $PWD) >> $1
        echo "** File description:" >> $1
        echo "** "$3 >> $1
        echo -e "*/\n" >> $1
    fi
}

put_header "Makefile" "M"
echo -e "SRC\t=\tsrc/main.c\n" >> "Makefile"
echo -e "CFLAGS\t=\t-g3 -I./include\n" >> "Makefile"
echo -e "NAME\t=\t\c" >> "Makefile"
if [ $1 ]; then echo -e $1"\n" >> "Makefile"; else echo -e "a.out\n" >> "Makefile"; fi
echo -e "OBJ =\t\$(SRC:.c=.o)\n" >> "Makefile"
echo -e "all:\t\$(NAME)\n" >> "Makefile"
echo -e "\$(NAME):\t\$(OBJ)" >> "Makefile"
echo -e "\tgcc -o \$(NAME) \$(OBJ)\c" >> "Makefile"
echo -e " \$(CFLAGS)\n" >> "Makefile"
echo -e "clean:" >> "Makefile"
echo -e "\trm -fr \$(OBJ)\n" >> "Makefile"
echo -e "fclean: clean" >> "Makefile"
echo -e "\trm -fr \$(NAME)\n" >> "Makefile"
echo -e "re: fclean all\c" >> "Makefile"

put_header "main.c" "c" "main.c"
echo -e "#include \"$1.h\"\n" >> "main.c"
echo -e "int main(int ac, char **ag)" >> "main.c"
echo "{" >> "main.c"
echo -e "\treturn (0);" >> "main.c"
echo -e "}\c" >> "main.c"


put_header "include/"$1".h" "h" "$1.h"
echo "#ifndef _${1^^}_H_" >> "include/"$1".h"
echo -e "#define _${1^^}_H_\n" >> "include/"$1".h"
echo "#include <stdlib.h>" >> "include/"$1".h"
echo "#include <stdio.h>" >> "include/"$1".h"
echo "#include <string.h>" >> "include/"$1".h"
echo -e "#include <unistd.h>\n" >> "include/"$1".h"
echo -e "#define EXIT_ERROR 84\n" >> "include/"$1".h"

echo "#endif" >> "include/"$1".h"

echo "a.out" > .gitignore
echo $1 >>.gitignore
echo "*.o" >> .gitignore
echo "*~" >> .gitignore
echo ".vgcore" >> .gitignore
echo ".idea" >> .gitignore
echo ".vscode" >> .gitignore
