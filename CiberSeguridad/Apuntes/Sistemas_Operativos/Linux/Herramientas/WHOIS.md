[[Herramientas]]

Es un protocolo de petición y respuesta que sigue el estándar RFC 3912. Un servidor WHOIS escucha en el puerto TCP 43. Un servidor WHOIS nos responde con información variadas relacionada con el dominio solicitado, como por ejemplo:
- El registrador con el que el dominio fue registrado.
- Información de contacto del registrante.
- Fechas de creación, actualización y de expiración.
- Nombre del servidor.

Para conseguir esta información, tenemos que usar un cliente `whois` o un servicio online. De normal, es más rápido y más conveniente usar un cliente local `whois` 