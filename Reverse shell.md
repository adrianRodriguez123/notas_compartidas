Es una shell que se ejecuta en la máquina de la víctima. El procedimiento es el siguiente:

1 - Se puede aprovechar la vulnerabilidad LFI([[LFI (Local File Inclusion)]]) para subir la shell en el lenguaje que se esté usando en el servidor web. NOTA: En la reverse shell tiene que estar puesta nuestra IP.
2 - Una vez subido el fichero, nos ponemos a escuchar en el puerto que hayamos indicado en la reverse shell, por ejemplo el 1234.
3 - Después tenemos que ejecutar el fichero subido.
4 - Cuando se haya ejecutado, ya tendremos una reverse shell.


NOTA: Mirar máquina de THM Vulnversity.