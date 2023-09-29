https://deephacking.tech/cronjobs-privilege-escalation-en-linux/

Cron es un clock daemon (demonio de reloj) que se ejecuta constantemente en segundo plano, permite a los usuarios automatizar tareas. Esta utilidad Cron examina una lista de “cosas por hacer” en busca de alguna tarea programada pendiente por ejecutar, de ser así, la ejecuta, si no, espera un periodo de tiempo y vuelve a verificar la lista. Esta lista de cosas por hacer se llama _cron table_ o Crontab.

Cron se maneja con diferentes ficheros, en el directorio ==/etc/== se encuentran:

- cron.hourly
- cron.daily
- cron.weekly
- cron.monthly

Si se coloca un script en uno de estos directorios, se ejecutará cada hora, día, semana o mes, según el directorio donde se haya agregado. Estos directorios son administrados por el fichero crontab.


El fichero ==crontab== es el que contiene una lista de comandos destinados a ejecutarse en momentos específicos. Este tiene 5 campos para indicar las unidades de tiempo para ejecutar comandos ó tareas y su estructura es:

- _Minute / Hour / Day Of The Month / Month / Day Of The Week_


En Linux a aquellas tareas programadas dentro del fichero ==crontab== se le conoce como cronjobs. Los cronjobs se estructuran de la siguiente forma:

![[Pasted image 20230929164910.png]]

Ejemplo: 
![[Pasted image 20230929164931.png]]

Existen tres formas principales de explotar cronjobs:

- Permisos de archivo débiles (File Permissions / File Overwrite)
- Falta de la ruta absoluta en binarios y comandos (PATH Environment Variable)
- El uso de (*) que se emplean al ejecutar comandos, (Wildcards)

