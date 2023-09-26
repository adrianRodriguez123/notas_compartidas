## ¿Cuándo funciona?

Cuándo tenemos un **[[panel de autenticación]]**.

# [[Burp Suite]]

- Recomendación: usar Burp Suite.

## ¿Qué es Burp Suite?

Proxy de interceptación que se encarga de estar en medio del [[navegador]] y el [[servidor web]]. 

Cuándo mandamos una petición de inicio de sesión, Burp Suite intercepta esa petición y podemos: manipular ese tráfico o extraerlo para hacer un intento de hacking.

## Activar Proxy

_En caso de Firefox_

1. Ajustes del navegador.
2. Buscamos por "Proxy".
3. Manual [[proxy]] configuration.
4. HTTP Proxy: `127.0.0.1` Port: `8080`
	1. ¿Por qué esto?
		Si nos metemos en el `Options` del `Proxy`, veremos en `Proxy Listeners` en qué interfaz y en qué puerto trabajo.


## Interceptando peticiones

Cuándo nos llega una petición, podemos copiar todo y guardarlo para empezar a hackearlo.

### [[SQLMAP]]

#### Primeros pasos - ¿Cómo usar sqlmap?

`sqlmap -r fileName.txt --level=5 risk=3 -dbs --random-agent`

> Nos facilita un ataque de [[SQL Inyection]]s.
> 	Con [[dbs]] vamos a decirle que nos devuelva las bases de datos.


Una vez finalizado el proceso, nos devolverá las bases de datos totales.


#### Segundos pasos - Tablas

`sqlmap -r fileName.txt -D baseDataName --tables`

> `-D`: indicar la base de datos que queremos atacar.
> 
> `--tables`: obtener las tablas.
> 	Ir por orden, primero obtenemos las bases de datos, luego las tablas, columnas y registros.

#### Últimos pasos - Columnas

`sqlmap -r fileName.txt -D baseDataName -T tableName --columns`

#### [[Desencriptrar]]

Usamos un desencriptador online, pegamos la contraseña hasheada y listo.