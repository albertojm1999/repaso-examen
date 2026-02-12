#!/bin/bash
#Realiza un script, ejercicio1.sh que nos muestre un menu:
#Menu
#1.- Listar usuarios.
#2.- Añadir usuarios.
#3.- Salir
#Realiza 3 funciones: menu, listar y anadir.
#La función listar, muestra el contenido del archivo miscorreos.txt
#La función anadir, pregunta: nombre y correo electrónico y a continuación lo vuelca en un fichero llamado miscorreos.txt en forma de nombre:correo.

clear



while true; do
    echo "-----------------------"
    echo "MENÚ"
    echo "-----------------------"
    echo "1.- Buscar usuarios."
    echo "2.- Añadir usuarios."
    echo "3.- Listar contenido."
    echo "4.- Salir."
    read -p "Elige un número: " num
    case $num in
        1)
            read -p "Elige un usuarios que buscar: " user
            buscar=$(grep $user miscorreos.txt)
            if [ -z $buscar ]; then
                echo "El usuario $user no existe."
            else
                echo "El usuario $user es este: "
                echo "$user"
            fi
        ;;
        2)
            read -p "Escribe el usuario que quieras añadir: " user
            buscar=$(grep $user miscorreos.txt)
            if [ ! -z $buscar ]; then
                echo "El usuario $user ya existe."
            else
                echo "$user" >> miscorreos.txt
                echo "usuario $user añadido de manera exitosa."
                cat miscorreos.txt
            fi
        ;;
        3)
            cat miscorreos.txt
        ;;
        4)
            break
            clear
            echo "Hasta la próxima."
        ;;
    esac
done

