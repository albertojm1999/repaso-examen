#Tenemos un archivo lista.txt que tiene el siguiente formato:
#Nombre:dirección:Teléfono:ciudad.
#Inicialmente está vacío.
#Debes crear un script ejercicio2.sh que tenga el siguiente menú:
#1.- Listar contactos.
#2.- Añadir un contacto.
#3.- Buscar un contacto.
#4.- Borrar un contacto.
#5.- Salir.

clear

while true; do
    echo "--------------------AGENDA--------------------"
    echo "1.- Listar contactos."
    echo "2.- Añadir un contacto."
    echo "3.- Buscar un contacto."
    echo "4.- Borrar un contacto."
    echo "5.- Salir."
    echo "-----------------------------------------------"
    read -p "Elija un número: " num
    if [[ $num < 1 || $num > 5 ]]; then
        echo "Error, número inválido."
        break
    fi
    case $num in
        1)
            clear
            echo "--------------Estos son los contactos--------------"
            cat lista.txt
        ;;
        2)
            read -p "Dime el contacto que quieras añadir (Nombre:dirección:Teléfono:ciudad): " contact
            echo "$contact" >> lista.txt
            clear
            echo "Contacto añadido de manera existosa"
        ;;
        3)
            read -p "Dime el nombre del contacto que estás buscando: " nombre
            buscar=$(grep $nombre lista.txt)
            if [ -z $buscar ]; then
                echo "El contacto $nombre no existe."
            else
                echo "Aquí está el contacto $nombre: "
                echo "$buscar"
            fi
        ;;
        4)
            read -p "Dime el nombre del contacto que quieras borar: " nombre
            buscar=$(grep $nombre lista.txt)
            if [ -z $buscar ]; then
                echo "El contacto no existe."
            else
                sed -i /$nombre/Id lista.txt
                clear
                echo "Contacto $nombre borrado de manera correcta"
                cat lista.txt
            fi
        ;;
        5)
            clear
            echo "-----------------------------"
            echo "Hasta la próxima."
            echo "-----------------------------"
            break
    esac
done
