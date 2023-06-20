(Server-Side request forgery)
[[Vulnerabilidades]]

Es una vulnerabilidad que permite a un usuario malicioso causar que un webserver hacer peticiones HTTP (o editarlas) al recurso que le indique el atacante. Existen 2 tipos:
	1. Regular SSRF: Cuando los datos se muestran en la pantalla del atacante.
	2. Blind SSRF: Los datos no se muestran en la pantalla del atacante.

El impacto que puede tener es el siguiente:
	- Acceso a lugares no autorizados.
	- Acceso a datos de clientes/organización.
	- Capacidad para escalar dentro de la red interna.
	- Revelar tokens/credenciales.

