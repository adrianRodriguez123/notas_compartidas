a.k.a. Directory traversal or dot-dot-slash attack
[[File Inclusion]]

Ocurre cuando el input del usuario se envía a una función, y no está sanitizada y entonces nos permite leer recursos del sistema operativo.


Ficheros interesantes de ver en un path traversal:
- /etc/issue
- /etc/profile
- /proc/version
- /etc/passwd
- /etc/shadow
- /root/.bash_history
- /var/log/dmessage
- /var/mail/root
- /root/.ssh/id_rsa
- /var/log/apache2/access.log
- c:\boot.ini
