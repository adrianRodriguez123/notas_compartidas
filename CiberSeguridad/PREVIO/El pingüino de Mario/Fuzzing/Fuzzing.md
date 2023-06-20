El Fuzzing consiste en encontrar subdirectorios ocultos dentro de una página web.

Existen varios métodos, pero en este caso, vamos a usar [[Gobuster]]:

`gobuster dir -w /usr/share/wordlists/dirb/common.txt -u http://...`

A través de un diccionario, comprueba palabra por palabra a ver si existe alguna de estas palabras dentro de la página web.

