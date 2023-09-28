[[File_Inclusion]]
1. Mantener los servicios y sistemas actualizados.
2. Quitar los errores de PHP(en un server web que utilice PHP) para evitar leakeos de paths y otros datos sensibles.
3. Utilizar un Web Application Firewall (WAF).
4. Deshabilitar algunas características PHP que lleven a la vulnerabilidad File Inclusion, en caso de no necesitarlo, como por ejemplo `allow_url_fopen` o `allow_url_include`.
5. Permitir únicamente los protocolos que sean necesarios.
6. NUNCA CONFIAR EN EL INPUT DEL USUARIOS. Es necesario sanitizar y validar correctamente los inputs.
7. Implementar una whitelist para nombres de ficheros y sus paths. Hacer lo mismo con una blacklist.