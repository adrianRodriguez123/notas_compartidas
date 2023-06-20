Se encarga de hacer escaneos de vulnerabilidades de un equipo determinado.

Recomendado para encontrar las vulnerabilidades que hay en una IP, para hacer escaneos simples de puertos, MEJOR NMAP.

## 1. Instalación

Navegamos hasta "Tenable" y nos descargamos el archivo ".deb"...

**Para descomprimir archivos .deb:**

>[[sudo dkpg -i fileName.deb]]

Esto es un servicio que está corriendo por un puerto (el cuál se ve que es el 8834), pero primero hay que iniciar el servicio:

> sudo /bin/systemctl start nessusd.service

Y si viajamos a `https://localhost:8834` podremos acceder a Nessus.

## 2. Entrando a la página y realizando el escanéo

Después de registrarnos (y ponernos la cuenta básica, por ahora) tendremos 2 opciones que nos interesan: el Discovery Port (Simple, no recomendado, mejor NMAP) y la avanzada, que es la que nos interesa.

En targets ponemos la IP víctima... ¡Y au! Ya tendríamos todas las vulnerabilidades recopiladas de las vulnerabilidades que tenemos para explotar.

