Metasploit sirve para hacer pentesting.

Si sabemos que una máquina es vulnerable (posteior al reconocimiento, con [[nmap]]), tenemos que buscar la vulnerabilidades que queremos explotar:

>`search vulnerabilityName`
>Para buscar la [[Vulnerabilidad VSFTPD]].

1. Lo primero que tenemos que hacer, es usar la vulnerabilidad:

> `use #vulnerabilityNumber`
> Cuándo solo haya una vulnerabilidad, usualmente será el primero (0).

2. Para ver las opciones de configuración de la vulnerabilidad que estamos viendo:

> `show options

3. Para aprovecharnos de esta vulnerabilidad, hay varias [[payloads]] que nos ayudarán:

> `show payloads `

4. Tendremos una lista de payloads que serán los que tenemos disponibles para romper esta vulnerabilidad:

> `set payload number`

5. Ya la tenemos seleccionada, a continuación, veremos sus opciones:

> `show options`

6. Tenemos: el spolit, la configuración del sploit y la configuración del payload.

7. Insertamos la información de la máquina víctima:

> `set RHOSTS ipVictim`

_Por lo general, no hará falta poner el [[Puerto]], porque Metasploit ya sabe en qué puerto corre esa vulnerabilidad._

Y nuestra información:

> `set LHOSTS ourIP`

8. Corremos el sploit:

> `run`



