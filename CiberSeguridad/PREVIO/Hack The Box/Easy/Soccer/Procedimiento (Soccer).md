## Reconocimiento

Con `nmap -p- -sVC -sC -sS --open -vvv -n -Pn ping -oN escaneo` encontramos 2 o 3 puertos, un 22 (SSH) y 80 (http).

En el 80 encontramos la página `http://soccer.htb`.

## Fuzzing

Con gobuster encontramos 2 directorios que pueden ser interesantes:

1. /tiny/
	Aquí encontramos un formulario, que si buscamos en internet el motor con el que está hecho (tinyfilemanager) hay 2 usuarios por defecto, el de "user" y el de "admin".

2. /tiny/uploads/
	Aquí se suben los archivos que subamos a esta página web.

## Reverse Shell

Nos ponemos en escucha por el puerto 444, subimos el archivo de .php que tenemos, y lo ejecutamos.

Estamos dentro.

## Escalando privilegios

Ahora, parece que no hay nada curioso en lo que podamos entrar o acceder, pero haciendo memoria, recordamos que el servidor está hosteado por "nginx", versión 1.18.0... Investigando un poco:

https://help.dreamhost.com/hc/es/articles/216455077-Ubicaciones-de-archivos-de-configuraci%C3%B3n-de-Nginx

https://ciberninjas.com/como-encontrar-carpeta-configuracion-nginx/

Aquí podemos ver que en [[/etc/nginx]] encontramos una carpeta interesante llamada "sites-enabled", dentro encontramos un subdirectorio curioso, llamado "soc-player.htb"...

Editamos el [[/etc/hosts]] y nos metemos en la página "http://soc-player.soccer.htb" y vemos algo nuevo muy interesante: espacios de "Match", "Login" y "Signup".

Con una cuenta creada, en "Tickets", encontramos algo interesante, viendo el código fuente de la página vemos que está directamente conectado con el WebSocket.

Cómo no tenemos ni idea de hacer SQL Inyection, buscamos: "websocket sql inyection" y encontramos esta página: "https://rayhan0x01.github.io/ctf/2021/04/02/blind-sqli-over-websocket-automation.html".











