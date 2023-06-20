[[Reverse shell]]

1. `   python -c 'import pty;pty.spawn("/bin/bash")';   `
2.  Presionar ctrl^z
3. `   stty raw -echo   `
4.   `stty size` (no sé si es necesario)
5. Ahora escribir 'fg' y presionar ENTER
6. `   export SHELL=bash   `
7. `   export TERM=xterm-256color   `