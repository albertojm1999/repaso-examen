#Crea un script que reciba por parámetro una lista de nombres de ficheros. Para cada
#fichero cuya ruta se ha pasado por parámetro, muestra en pantalla su contenido.
#Si el fichero no existe, se mostrará un mensaje indicando que no existe.
#Si el fichero es un directorio, se mostrarán la información extendida de permisos
#propietario y grupo.
#Si el fichero es un fichero regular, se mostrará su contenido. En cualquier otro caso se
#mostrará un mensaje indicando que el tipo del fichero no es válido y se mostrará
#información extendida de permisos, propietario y grupo del fichero

clear

fich=$1

if [[ $fich -gt 1 || ! -d $fich ]]; then
    echo "Error. Algo salió mal."
    exit 0
fi

if [ -f $fich ]; then
    echo "-------------CONTENIDO DEL FICHERO-------------"
    cat $fich
elif [ -d $fich ]; then
    echo "-------------CONTENIDO DEL DIRECTORIO-------------"
    ls -l $fich
fi

