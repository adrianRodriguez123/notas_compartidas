# Mejorar Shell

>[[script /dev/null -c bash]]

Para ponerla aún mejor:

> `control + z`
> [[stty -raw echo; fg]]
> `reset xterm`
> [[export TERM=Xterm]]

Y ahora tenemos la shell más interactica.


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







