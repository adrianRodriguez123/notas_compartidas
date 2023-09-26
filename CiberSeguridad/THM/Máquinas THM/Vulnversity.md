## NMAP

Hay muchísimas combinaciones con [[Nmap]]:

`sudo nmap -p- -sVC -sC --open -sS -vvv -n -Pn IP`
`sudo nmap -p- -sVC -sC --open -sS -vvv -n -Pn 127.0.0.1`
`sudo nmap -p- -sVC -sC --open -sS -vvv -n -Pn 127.0.0.1 -oN escaneo`

**-p**: quiero encontrar puertos abiertos.
	**-p-400**: escaneará 400 puertos.
**-sVC**: quiero encontrar la versión de las servicios que corren detrás de estos puertos.
**--open**: quiero saber que están abiertos.
**-vvv**: a medida que nos vaya encontrando cosas, que nos las vaya reportando sobre la marcha (en orden, por así decirlo).
**-n**: para que no me haga resolución DNS (iría más lento).
**-oN**: guárdamelo dentro de un fichero llamado "escáneo".

**THM**
**-A**: permite la detección de la versión y del Sistema Operativo, ejecuta scripts ya hechos para hacer búsquedas más profundas.
**-sC**: escánea con los scripts de Nmap que vienen por defecto.
**-sU**: escánea puertos UDP.
**-sS**: escánea puertos TCP.
**-O**: most likely operating system the machine is running.

## GOBUSTER

Sirve para encontrar [[subdirectorios]], localizar un directorio al que puedas subir una [[SHELL]].

Primero escanemos si la web tiene directorios ocultos (Gobuster).

`gobuster dir -u URL -w wordListLocation`

**-e**: printar las URL's en mi consola.
**-u**: la URL objetivo.
**-w**: path a mi wordlist.
**-u, -p**: usuario y contraseña para autenticación básica.
**-p `<x>`: proxy usado para las peticiones.
-c `<http cookies>`: especifica una cookie para simular mi autenticación.

`/internal/`: directorio que tiene una página de subida de formulario. 

## COMPROMETER LA WEB SITE

Hemos encontrado un formulario en el que subir archivos, podemos subir un archivo y ejecutar el payload.

https://blog.hackmetrix.com/arbitrary-file-upload/#:~:text=Esta%20vulnerabilidad%20ocurre%20en%20aplicaciones,ejecutarlos%20en%20el%20mismo%20servidor.

https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php

Uno de las extensiones más comunes con las que subir un sploit es con **.php**.

Para esto, vamos a usar [[Burp Suite]], más concretamente, la parte del **Intruder**.

No sé qué pasa en esta parte, por ahora, vamos a pasar de eso y hacer el archivo .php.

Le cambiamos nuestro IP y puerto (por el que escucharemos posteriormente) y le renombraremos a -phtml.

Nos ponemos en escucha por el puerto en el que hemos puesto en el que hemos puesto en el documento.

Lo subimos y navegamos hasta la ruta del /internal/uploads/php-reverse-shell.phtml para ejecutar el payload (que se supone que hemos subido).

Ya estamos dentro.

## ESCALADA DE PRIVILEGIOS

SUID (permisos).

Podemos cambiar los permisos de un archivo ejecutable...

`find / -user root -perm -4000 -exec ls -ldb {} \;`
Buscar todos los archivos SUID.


