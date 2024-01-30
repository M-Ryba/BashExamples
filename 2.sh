#!/bin/bash
#Program, który dla liczby naturalnej 'a' większej od zera program wypisze liczby 1,...,a oraz w osobnej linii liczby 1^2,...,a^2.
#W przypadku niepoprawnych danych program ma wypisać komunikat BŁĄD oraz ma zakończyć działanie.
read -p "Podaj liczbę naturalną" a
if ! [[ "$a" =~ ^[0-9]+$ ]] || [ "$a" -le 0 ]; then
  echo "BŁĄD"
  exit
else
  for (( i=1; i<$a; i++ )); do
    echo -n "$i "
  done
    echo -n "$i"
  echo
  for (( i=1; i<$a; i++ )); do
    echo -n "$((i*i)) "
  done
    echo -n "$((i*i))"
  echo
fi

#Będzie wypisywał (od razu) wprowadzany ciąg znaków.
read -r -d '' tekst
echo -e "$tekst"

#Pobierze dwa ciągi. Następnie skrypt ma sprawdzić czy drugi napis jest podsłowem pierwszego napisu.
read ciag1
read ciag2
if [[ $ciag1 =~ $ciag2 ]]; then
  echo "TAK"
else
  echo "NIE"
fi

#Będzie obliczał pierwiastek naturalny z liczby naturalnej  a
#W przypadku podania niepoprawnych danych program ma wczytać te dane ponownie
#W przypadku negatywnej odpowiedzi program ma wypisać komunikat: NIE
read number
until [[ $number =~ ^[0-9]+$ ]]; do
  read number
done
low=0
high=$number
while [ $low -le $high ]; do
  sum=$(($low+$high))
  mid=$(($sum/2))
  sqr=$(($mid*$mid))
  if [ $sqr -eq $number ]; then
    echo "$mid"
    exit
  elif [ $sqr -gt $number ]; then
    high=$(($mid-1))
  else
    low=$(($mid+1))
  fi
done
echo "NIE"

#Pobierze od użytkownika liczbę całkowitą większa od zera, a następnie pobierze od użytkownika n słów i wyświetli je na ekranie.
until [[ $number =~ ^[0-9]+$ ]] && [ $number -gt 0 ];  do
  read number
done
count=0
until [ $count -ge $number ]; do
  read word
  if [[ $word =~ [a-zA-Z]+ ]]; then
    echo "$word"
    count=$((count+1))
  fi
done

#Będzie liczył iloczyn liczb całkowitych wprowadzanych przez użytkownika liczb do momentu wprowadzenia przez użytkownika wartości 0.
#Program ma wypisać obliczoną wartość. W przypadku podania od razu liczby 0 program ma wypisać wartość 1.
read n
if [ $n -eq 0 ]; then
  echo 1
  exit
else
  iloczyn=1
  until [ $n -eq 0 ]; do
    iloczyn=$((iloczyn * $n))
    read n
  done
echo "$iloczyn"
fi

#Pobierze od użytkownika liczbę oraz literę z alfabetu łacińskiego. Wynikiem programu mają być nazwy klas w postaci: liczba_litera.
read n
read l
for (( number=1; number <= $n; number++ )); do
  for letter in {a..z}; do
    if [[ $letter = $l ]]; then
      echo "$number$letter"
      break
    else
      echo -n "$number$letter,"
    fi
  done
done

#Pobierze od użytkownika liczbę całkowitą 'n', a następnie wypisze sumę jej cyfr.
read number
if [ $number -lt 0 ]; then
  number=$((-number))
fi
sum=0
until [ $number -eq 0 ]; do
  digit=$((number%10))
  sum=$((sum+digit))
  number=$((number/10))
done
echo "$sum"

#Będzie pobierał dokładnie jeden argument. W innym przypadku program ma wygenerować odpowiedni komunikat.
#Następnie skrypt ma wypisać rozmiar wszystkich plików oraz katalogów nazwie podanym jako argument.
if [ $# -ne 1 ]; then
  echo "Nie został podany dokładnie 1 argument."
else
  du -h *"$1"*
fi

#Będzie pobierał dokładnie dwa argumenty. W innym przypadku program ma wygenerować odpowiedni komunikat.
#Następnie skrypt ma wypisać liczby z przedziału podanego jako argument.
if [ $# -ne 2 ]; then
  echo "Nie zostały podane dokładnie 2 argumenty."
else
  for (( i=$1; i<=$2; i++ )); do
    if [ $i -eq $2 ]; then
      echo -n "$i"
    else
      echo -n "$i "
    fi
  done
  echo
fi
