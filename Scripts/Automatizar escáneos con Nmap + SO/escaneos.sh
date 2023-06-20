#!/bin/bash

#Comprobamos si está instalado:
#
#
test -f /usr/bin/nmap

if [ "$(echo $?)" = "0" ]; then
        echo "Las dependencias están satisfechas"

else
        echo "Hay que instalar dependencias" && apt update >/dev/null && apt install nmap -y /dev/null && echo "Dependencias instaladas"

fi
#Aquí termina.
#
#

#Analizamos con Nmap:
#
#
host=$1

echo "Vamos a analizar la siguiente dirección IP: $host"

ping -c 1 $host > ping.log

for i in $(seq 60 70); do
	if test $(grep ttl=$i ping.log -c) = 1; then
		echo "Es un Linux"
fi
done

for i in $(seq 100 200); do
	if test $(grep ttl=$i ping.log -c) = 1; then
		echo "Es un Windows"
fi
done

rm ping.log

nmap -p- -sCV --open -sS --min-rate 5000 -vvv -n -Pn $host -oN escaneo