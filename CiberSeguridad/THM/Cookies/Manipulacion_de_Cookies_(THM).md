Cuándo tengamos un sitio vulnerable en el que, por ejemplo, tengamos un espacio de [Login]:

1. Creamos un usuario (en el caso de no tener uno), e iniciamos sesión en la página web.

2. Abrimos la consola de comandos y nos vamos a "Aplicación", al apartado de "[[cookies]]".

3. Nos aparecerá una que se llamará "[[authid]]".

4. Copiaremos su valor, el cuál estará en [[Base64]], con lo cuál, tendremos que decodificarlo.

5. Si hacemos otro usuario y repetimos lo anterior, podremos ver que hay una parte del valor de la cookie que se repite.

6. Si nos fijamos, en este caso la sintáxis de la cookie en la siguiente: "userName + parteQueSeRepite".

7. Sabiendo el nombre del usuario al que queremos compremeter, en este caso, "_mcinventory_", con lo que podremos acceder a su usuario de la siguiente manera: "mcinventoryparteQueSeRepite".

8. Esta cookie está decodificada, tenemos que encodificarla a [[Base64]] otra vez.

9. Con la cookie encodificada, nos vamos a nuestra página web vulnerable, y en dónde estaba nuestra cookie, pegamos la nueva, reiniciamos... ¡Y ya estaría!
