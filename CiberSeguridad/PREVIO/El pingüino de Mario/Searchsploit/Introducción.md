Base de datos dónde se almacenan los sploits más utilizados.

>`searchsploit nameExploit`

Para bajarnos / downloadear el sploit:

>`searchsploit -m pathSploit`
  `searchspolit -m windows/dos/135.pl`

Con el sploit descagado, podremos abrirlo para ver información que nos podría ser importante... como el CVE. Podemos buscar el CVE con, por ejemplo, "CVEcode how to spolit github", y encontrar información sobre esta vulnerabilidad en github.

**COSA CURIOSA: SI UN ARCHIVO NOS SALE RESALTADO EN VERDE (KALI), ESO SIGNIFICA QUE TIENE PERMISOS DE EJECUCIÓN.**

Una vez vista la información de Github, podemos clonarnos el directorio en nuestra máquina, con [[git]]: `git clone`, y ejecutar el archivo .py:

> *Recomendable hacerlo en sudo*
> `sudo python3 nameSploit.py -host victimIp`

`script /dev/null -c bash`
Para tener el prompt que nos sale "bonito".

>[[script /dev/null -c bash]]
