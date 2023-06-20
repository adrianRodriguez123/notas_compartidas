[[Herramientas]]
Creada por Gordon Lyon (Fyodor)
Herramienta para realizar un descubrimiento de los sistemas de una red.
Estos son los pasos por los que NORMALMENTE suele pasar un escaneo con NMAP:
1. Enumerar objetivos
2. Descubrir hosts activos
3. Buscar DNS de forma inversa (Reverse-DNS)
4. Escanear puertos
5. Detectar versiones
6. Detectar sistemas operativos
7. Traceroute
8. Scripts
9. Escribir todo en un fichero

Flags:

- -sV : Especifica la versión de los servicios corriendo en los puertos abiertos.
- -p-: Especifica todos los puertos
- -p-x: Especifica los primeros x puertos
- -px: Especifica solo el puerto x
- -sC: Indica el script de nmap correspondiente
- -v: Verbose mode
- -sU: UDP port scan
- -sS: TCP SYN port scan
- -sN: Nmap listará los hosts que escaneará sin escanearlos
- -sn: Descubre hosts online <span style="color:#e8264d">sin escaneo de puertos</span>
- -PR: Escaneo solamente de ARP
- -PE: Realizar una petición ICMP echo para descubrir hosts activos
- -n: No busca DNS
- -R: Hace una búsqueda reverse-DNS para todos los hosts


