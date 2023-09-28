[[Herramientas]]

Web fuzzer.

- `ffuf -w /usr/share/wordlists/SecLists/Usernames/Names/names.txt -X POST -d "username=FUZZ&email=x&password=x&cpassword=x" -H "Content-Type: application/x-www-form-urlencoded" -u URL -mr "username already exists" `
	- -w : Wordlist
	- -X : tipo de petición (GET, POST...)
	- -d : Datos a enviar
	- -H : Cabeceras adicionales. En este caso seteamos el Content-type para que el servidor web sepa que le estamos enviando datos del formulario.
	- -u : URL
	- -mr : Es el texto que estamos buscando para validar lo que queremos. En este caso estamos validando una enumeración de usuarios.
	- -fc : Status code