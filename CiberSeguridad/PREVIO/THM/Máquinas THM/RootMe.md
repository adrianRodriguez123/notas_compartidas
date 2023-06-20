## RECONOCIMIENTO

Hacemos un `sudo nmap -p- -sVC -sS -sC --open -vvv -n -Pn 10.10.111.195 -oN escaneoRootMe` y nos devuelve que hay 2 puertos abiertos: ssh (22) y http (80).

Después de esto, usamos gobuster y descubrimos un par de directorios interesantes: /panel/ y /uploads/.

## CONSIGUIENDO UNA SHELL

Subimos la que tenemos en .php en /panel/, y dentro del directorio /uploads/ veremos que está subido lo que hemos subido en /panel/.

Buscamos: `http://10.10.111.195/uploads/nombreDelArchivoSubido` y ya tenemos acceso a la máquina.

## ESCALANDO PRIVILEGIOS

Primero, buscamos el archivo "user.txt" que sabemos que existe (nos lo pone en la máquina): `find / -name user.txt 2>/dev/null`.

Para **escalar privilegios**, buscamos archivos SUID's:

> [[find / -user root -perm /4000 2>/dev/null]]

Encontramos uno interesante... Cómo siempre, se trata de python (lo he descubierto a la primera XD), pues será: /user/bin/python...

Me meto en [[GTOBINS]] (que parece un sitio que nos da reverse shells):



