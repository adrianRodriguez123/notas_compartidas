## Reconocimiento

Con `nmap -p- -sVC -sC -sS --open -vvv -n -Pn 10.10.11.189 -oN escaneoPrecious` encontramos 2 puertos: 22 (ssh) y 80 (http).

Además de esto, no encontramos subdirectorios ocultos, por lo que habrá que aprovechar alguna.

Parece que hay 4 vulnerabilidades explotables.

No se puede ejecutar ataques de inyección (XSS), está protegido.

