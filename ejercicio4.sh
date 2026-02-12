#Crea un script grupos.sh que mostrará en pantalla información de los grupos que tengan
#algún miembro.
#Primero, mostrará la lista de grupos que no tienen ningún miembro. Para cada grupo,
#comprobará si no tiene miembros. Si no tiene miembros el grupo, entonces mostrará su
#nombre.
#Después, para cada grupo del sistema, si tiene miembros, mostrará información del
#grupo. La información será el nombre del grupo y la lista de usuarios que son miembros
#del grupo

#!/bin/bash
lineas=$(cat /etc/group)

echo "--- Grupos sin miembros ---"
for linea in $lineas; do
    # Extraemos el nombre (campo 1) y los miembros (campo 4) usando 'cut'
    nombre=$(echo "$linea" | cut -d: -f1)
    miembros=$(echo "$linea" | cut -d: -f4)

    if [ -z "$miembros" ]; then
        echo "Grupo vacío: $nombre"
    fi
done

echo "" # Espacio en blanco

# 2. Grupos con miembros
echo "--- Grupos con miembros ---"
for linea in $lineas; do
    nombre=$(echo "$linea" | cut -d: -f1)
    miembros=$(echo "$linea" | cut -d: -f4)

    if [ -n "$miembros" ]; then
        echo "Grupo: $nombre | Usuarios: $miembros"
    fi
done