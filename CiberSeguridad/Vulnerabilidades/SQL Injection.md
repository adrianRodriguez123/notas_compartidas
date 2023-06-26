Una vulnerabilidad de inyección SQL se produce cuando es posible ejecutar comandos SQL en un servidor web.

[[Vulnerabilidades]]
Algo tan sencillo como:
		**'or '1'='1**

puede hacer login sin tener cuenta, si en la web atacada, la consulta está mal construida. NOTA IMPORTANTE: No probar en sitios NO CONTROLADOS. 

Una forma de detectar SQL Injection es con "In-Band SQL Injection". 