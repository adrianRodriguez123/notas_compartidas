[[5 Fases de Hacking Ético]]

2 tipos. Active y passive

### <span style="color:#e8264d">Passive</span>
Buscar información relacionada con el objetivo pero sin tocar a la empresa. Se centra en la información que está pública. Por ejemplo: buscar en google, buscar registros DNS de un dominio de un servidor DNS público, chequear anuncios de trabajo relacionados con la web de la víctima, leer noticias y/o artículos sobre la víctima.

El proceso a seguir es el siguiente:
- Target Validation: WHOIS, nslookup, dnsrecon
- Finding subdomains: Google Fu, dig, nmap, sublist3r, blute, crt.sh, etc...
- Fingerprinting: nmap, wappalyzer, whatweb, builtwith, netcat, etc...
- Data breaches: HaveIBeenPwned, breach-parse, weleakinfo, etc...

Herramientas útiles: [[Hunter.io]], [[Phonebook.cz]]


### <span style="color:#e8264d">Active</span>
Cuando ya se busca información relacionada con el objetiv<span style="color:#e8264d"></span>o tocando a la empresa. No es tan discreta con la Pasiva. Por hacer un ejemplo más real, sería como mirar las puertas y las ventanas de una casa, entre otros puntos potenciales de entrada. Por ejemplo: escaneo de puertos, usar nessus, usar nikto, conectarse a los servidores de una compañía, mingeniería social, entrar directamente en la empresa pretendiendo ser algún reparador.

NOTA: Con el recon active, uno se puede mter en problemas legales.