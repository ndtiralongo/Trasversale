#!/bin/bash

for filiale in 01 02 03 04 05
do
	prima_riga=1
	while read linea
	do
		if [ $prima_riga -eq 1 ]
		then
			prima_riga=0
			if [ "$filiale" == '01' ]
			then
				# Aggiungo l'intestazione per il nuovo campo come ultima colonna
				echo "${linea};filiale" > merged.csv
			fi
		else
			# Riporto la linea, aggiungendo il codice della filiale
			echo "${linea};$filiale" >> merged.csv
		fi		
	done < $filiale/export.csv
done
