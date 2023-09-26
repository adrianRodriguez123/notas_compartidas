(Server-Side request forgery)
[[Vulnerabilidades]]

Es una vulnerabilidad que permite a un usuario malicioso que un webserver haga peticiones HTTP (o editarlas) al recurso que le indique el atacante. Existen 2 tipos:
	1. Regular SSRF: Cuando los datos se muestran en la pantalla del atacante.
	2. Blind SSRF: Los datos no se muestran en la pantalla del atacante.

El impacto que puede tener es el siguiente:
	- Acceso a lugares no autorizados.
	- Acceso a datos de clientes/organización.
	- Capacidad para escalar dentro de la red interna.
	- Revelar tokens/credenciales.

4 ejemplos de SSRF típicos:

1. Cuando se usa una URL dentro de un parámetro de la barra de dirección:
		https://miweb.com/form?server=http://api.miweb.com/usuarios

2. Un campo oculto en un formulario:
		![[Pasted image 20230622170651.png]]

3. Se puede encontrar un SSRF en una URL y que se le indique un trozo de la URL que queramos:
		![[Pasted image 20230622170840.png]]

4. Igual que el anterior pero se le puede indicar el path de la URL:
		![[Pasted image 20230622170959.png]]