---
imageNameKey: Academy-HTB-retired
---
# Introducción

Academy es una máquina fácil retirada de Hack The Box de Linux. [TODO]


# Enumeración

Comenzamos analizando el host en la red (`nmap -sC -sV -oN escaneo 10.0.2.15`). Podemos ver que tiene abiertos los puertos 21, 22 y 80.


![[Academy-HTB-retired-20231001-escaneoNmap.png]]

Como diría Jack el destripador, vamos por partes.
![[Academy-HTB-retired-20231001-jackdestripador.png]]

###### PUERTO 21
Si nos fijamos bien, nos daremos cuenta de que el puerto 21, FTP, tiene acceso anónimo. Cuando entramos vemos un fichero .txt el cual nos dice lo siguiente: 

![[Academy-HTB-retired-20231001-ftpLoginAnonymous.png]]

Bingo! Tenemos una contraseña aunque encriptada: . Crucemos los dedos para que esté en MD5 .


###### PUERTO 22
Login SSH normal y corriente.


###### PUERTO 80
Cuando accedemos al puerto 80, vemos la default page de apache. 


# Explotación

Si vemos la nota que nos descargamos del puerto FTP tenemos....una contraseña! Aunque encriptada pero bueno, nos sirve. Contraseña: `cd73502828457d15655bbd7a63fb0bc8`. Crucemos los dedos para que esté en MD5🤞. Cuenta atrás...3...2...1...BINGO!

![[Academy-HTB-retired-20231001-passwrodStudentCrackeada.png]]

Por tanto ya tenemos acceso a algo, luego veremos a que.

Si realizamos fuzzing al puerto 80 podemos encontrar diferentes dominios, entre los cuales, los que más nos interesan son /academy, /academy/admin, /phpmyadmin (este no tanto pero está bien tenerlo). También podemos encontrar algunos ficheros muy muy interesantes como por ejemplo `onlinecourse.sql`.

Parece ser que la web es una web para algún colegio para estudiantes y profesores. Este portal parece ser el de estudiantes.

![[Academy-HTB-retired-20231001-student-page.png]]

Si insertamos las credenciales encontradas podemos entrar a la cuenta del usuario un estudiante, conocido como `Rum Ham`. 

![[Academy-HTB-retired-20231001-logueostudent.png]]

Si entramos dentro de la parte de `My Profile` vemos algo muy interesante :)

![[Academy-HTB-retired-20231001-profilestudent.png]]

Podemos subir ficheros sin restricción, eso quiere decir....que podemos subir una shell y tener RCE. Ahora solo nos faltaría saber como ejecutar ese fichero.

Dentro del fichero `onlinecourse.sql` nos encontramos el fichero de creación de la base de datos y podemos ver unas credenciales de un usuario admin. Oh yeah😎.

![[Academy-HTB-retired-20231001-bbdd-admin.png]]

Si usamos estas credenciales para entrar como admin nos podemos encontrar lo siguiente:

![[Academy-HTB-retired-20231001-adminlogin.png]]

A priori no hay nada jugoso.


Cuando buscamos exploits en la web sobre "Online Course Registration", podemos encontrar que hay un exploit ya desarrollado:

![[Academy-HTB-retired-20231001-exploitRCE.png]]

Nos descargamos el exploit, luego lo ejecutamos con python 2.7, y después....we're in the building🤩. 

Podemos ver que estamos como el usuario www-data y que tampoco es una shell que nos permita hacer muchas cosas cómodamente. Pero bueno, tenemos algo. Vamos a averiguar donde se almacena el fichero que hemos subido.

Si viajamos hasta el path `/var/www/html/academy`, vemos que hay un directorio llamado `studentphoto` y ahí lo tenemos. Como ya estamos dentro del ordenador de la víctima y podemos subir ficheros, podemos subir el fichero linPEAS, utilizado para encontrar vulnerabilidades dentro de la máquina y poder hacer una escalada de privilegios como dios manda.

![[Academy-HTB-retired-20231001-wwwdatauser1.png]]

![[Academy-HTB-retired-20231001-wwwdatauser2.png]]

Una vez realizado todo este proceso, cuando ejecutamos linPEAS, podemos ver que hay una contraseña nueva, y encima está sin encriptar :). Contraseña: My_V3ryS3cur3_P4ss. También vemos que pertenece a mysql, así que si lo introducimos en phpmyadmin, podemos a entrar a ver la base de datos. Pero bueno, esto es algo que para escalar no nos hace mucha falta, solo nos vendría bien por si queremos hacer cosas malas, Y ESO NO LO VAMOS A HACER.

![[Academy-HTB-retired-20231001-passphpmyadmin.png]]

Pero ahora bien, si recordamos, al principio de todo, un tal jdelta había comentado en el fichero note.txt que un tal Grimmie no usará la misma contraseña para todo, que ya se lo ha dicho. Si esto lo unimos a que, existe otro usuario con shell llamado...grimmie podemos probar a ver que pasa si nos logueamos con ssh, y así autenticarnos como grimmie, tener más permisos, una mejor shell y toda la pesca.

BINGO!

Ahora, a parte de tener una mejor shell (que esto lo podríamos haber conseguido antes), podemos ver si grimmie tiene otros permisos o puede ejecutar sudo o cualquier otra cosa. Vamos, que estamos más cerca de ser `root`.

![[Academy-HTB-retired-20231001-grimmielogin.png]]

# Post-explotación