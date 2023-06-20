Primero de todo, hay que saber qué equipos tenemos dentro de nuestra [[red]] / [[redes]], posteriormente ver los [[puertos]], los [[servicios]] detrás de estos puertos... Estamos hablando de la fase de [[Reconocimiento]].

## ¿Qué equipos hay conectados en mi red?

1. Tenemos que mirar nuestra [[IP]]:

	**Parrot**: [[hostname -I]]
	**Kali**: [[ifconfig]] (cogemos la del eth0).

2. Cuándo la tengamos, cogemos los tres primeros números _(000.000.0)_ y hacemos:

`sudo nmap -O ourIP.0/24`
`sudo nmap -O 127.1.1.0/24`

_(No hace falta el sudo pero recomendable)._

Con esto estamos representado la totalidad de nuestra [[red]]  (Escaneo de todos los equipos conectados a nuestra red).

El `-O` sirve para detectar el OS de cada equipo.


## Escáneo de un equipo

1. Copiamos la dirección IP a inspeccionar.

2. Hay muchísimas combinaciones con [[Nmap]]:

`sudo nmap -p- -sVC -sC --open -sS -vvv -n -Pn IP`
`sudo nmap -p- -sVC -sC --open -sS -vvv -n -Pn 127.0.0.1`
`sudo nmap -p- -sVC -sC --open -sS -vvv -n -Pn 127.0.0.1 -oN escaneo`

**-p**: quiero encontrar puertos abiertos.
**-sVC**: quiero encontrar la versión de las servicios que corren detrás de estos puertos.
**--open**: quiero saber que están abiertos.
**-vvv**: a medida que nos vaya encontrando cosas, que nos las vaya reportando sobre la marcha (en orden, por así decirlo).
**-n**: para que no me haga resolución DNS (iría más lento).
**-oN**: guárdamelo dentro de un fichero llamado "escáneo".

Hay combinaciones similares, con otros parámetros, otro orden, pero casi siempre es así.



