#!/bin/bash
# Wyświetli 7,5 i 3 kolumnę pierwszej linii z pliku /etc/passwd, rozdzielając je znakiem spacji.
echo "`cut -d ':' -f 7 /etc/passwd | head -n 1` `cut -d ':' -f 5 /etc/passwd | head -n 1` `cut -d ':' -f 3 /etc/passwd | head -n 1`" 
