[[Vulnerabilidades]]

(Insecure Direct Object Reference)

Es una vulnerabilidad que consiste en que se pueden ver datos sensibles de otros usuarios y no está permitido que se vean por otros usuarios. Esto ocurre porque en la forma de visualizar los datos, no se validan los datos de input. Es decir, si se busca: `http://miempresa.com/user_id=7`, se deberían ver los datos del usuario con ID=7. Sin embargo, si buscarámos `http://miempresa.com/user_id=1` y se mostraran los datos del usuario con ID=1, ahí tendríamos una vulnerabilidad de tipo IDOR. 

También se puede presentar en datos codificados en diferentes técnicas(por ejemplo base64), donde lo que habría que realizar es primero una decodificación de los datos, cambiarlos a los datos que quisiéramos, y volver a codificarlos.

![[Pasted image 20230613115930.png]]