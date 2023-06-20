
Si hacemos un 

> `ping -c 1 www.google.es`
> Tenemos que fijarnos en su [[TTL]], que es lo que nos dirá el tipo de máquina ante la que estamos.
> 
> Si es entre 60 y 70, estamos ante un [[Linux]], pero si es ciento y pico, ante un [[Windows]].

1. Primero tenemos que seleccionar el intérprete:
`#!/bin/bash`

2. Creamos una variable (que almacenará la dirección [[IP]]):
`host=$1`

3. Mensajito explicativo:
`echo "Vamos a analizar la siguiente dirección IP: $host"`

4. Lanzamos una sola trama a la dirección IP que el usuario ha proporcionado, y después enviar el resultado a un fichero, para analizarlo posteriormente:
`ping -c 1 $host > ping.log`

5. Hacemos un for que inspeccione el ping.log en busca del [[TTL]] (que será lo que determine si nuestra máquina es Linux, Windows...)

	Realizará busquedas por todo el documento, para ver cuál será el valor de la _i_, que nos indicará si estamos ante un [[Linux]] o un [[Windows]].

6. Hay que darle [[permisos]] de ejecución.