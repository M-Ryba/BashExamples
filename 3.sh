#!/bin/bash
#Pobierze napis od użytkownika i sprawdzi czy jest on liczbą czy nie.
read -p "Podaj liczbę:" number
if [[ "$number" =~ ^[0-9]+\.?[0-9]*$ ]]; then
echo "True"
else
echo "False"
fi

#Pobierze od użytkownika tablice liczb oraz wypisze sumę wpisanych elementów.
read -p "Podaj tablicę liczb:" -a table
sum=0
counter=0
for element in ${table[@]}
do
  sum=$((sum+element))
done
echo $sum

#Pobiera 10 liczb całkowitych, a następnie wypisuje je w odwrotnej kolejności.
read -p "Podaj 10 liczb całkowitych:" -a array
for (( i=${#array[*]}; i>=0; i-- ))
do
  echo ${array[$i]}
done

#Pobierze od użytkownika słowo, a następnie wypisze w każdej linii osobno literę tego słowa. Znaki spacji pomijamy.
read -p "Podaj słowo:" word
array=( `echo $word | grep -o \.` )
for (( i=0; i<${#array[*]}; i++ ))
do
  echo ${array[$i]}
done

#Wczyta słowo od użytkownika, a następnie wypisze ilość samogłosek (a,e,i,o,u,y) oraz spółgłosek.
read -p "Podaj słowo:" word
array=( `echo $word | grep -o \.` )
vowel=0
consonant=0
for (( i=0; i<${#array[*]}; i++ ))
do
  if [[ "${array[$i]}" =~ ^[aeiouyAEIOUY]$ ]]; then
    vowel=$((vowel+1))
  else
    consonant=$((consonant+1))
  fi
done
echo "Liczba samogłosek: $vowel"
echo "Liczba spółgłosek: $consonant"

#Pobierze od użytkownika słowa (rozdzielone znakiem spacji), a następnie wypisze ilość wprowadzanych słów.
read -p "Podaj słowo:" words
read -a array <<< "$words"
counter=0
for (( i=0; i<${#array[*]}; i++ ))
do
  counter=$((counter+1))
done
echo $counter

#Pobierze liczby od użytkownika i wypisze jego największy element.
read -p "Podaj liczby:" -a array
biggest=${array[0]}
for (( i=1; i<${#array[*]}; i++ )) do
  if [[ ${array[$i]} -gt $biggest ]]; then
    biggest=${array[$i]}
  fi
done
echo $biggest

#Pobierze listę słów od użytkownika, a następnie wypisze pary słów, które nie są w odpowiedniej kolejności
#(w porządku rosnącym) tzn. w parze o indeksach i,j jeżeli i-te słowo jest większe niż j-te słowo to wypisuje parę tych słów
read -p "Podaj listę słów:" -a array
for (( i=0; i<${#array[*]}-1; i++)) do
  if [[ "${array[$i]}" > "${array[$i+1]}" ]]; then
    echo "${array[$i]} ${array[$i+1]}"
  fi
done

#Pobierze od użytkownika listę słów, a następnie posortuje te słowa rosnąco w porządku leksykograficznego.
read -p "Podaj listę słów:" -a array
for (( i=0; i<${#array[*]}-1; i++)) do
  for (( j=0; j<${#array[*]}-$i-1; j++)) do
    if [[ "${array[$j]}" > "${array[$j+1]}" ]]; then
      temp=${array[$j]}
      array[$j]=${array[$j+1]}
      array[$j+1]=$temp
    fi
  done
done
echo "${array[*]}"

# Funkcje w powłoce BASH o nazwie hello_function(), która wyświetli wiadomość: Witaj w świecie powłoki BASH!!!
hello_function() {
  echo "Witaj w świecie powłoki BASH!!!"
}
hello_function

#Funkcja get_min, która jako argument pobierze tablicę i wypisze jej najmniejszy element.
get_min() {
  read -a array <<< "$@"
  local smallest=${array[0]}
  for (( i=1; i<${#array[*]}; i++ )) do
    if [[ ${array[$i]} -lt $smallest ]]; then
      smallest=${array[$i]}
    fi
  done
  echo $smallest
}

#Skrypt w powłoce BASH, który będzie pobierał napis od użytkownika, a następnie wywoływał funkcje o nazwie is_palindrome()
is_palindrome() {
  local word=$1
  local rev_word=$(echo $word | rev)
  if [[ "$word" == "$rev_word" ]]; then
    echo "True"
  else
    echo "False"
  fi
}
read -p "Podaj napis:" text
is_palindrome $text

#Skrypt w powłoce BASH, który będzie pobierał słowo od użytkownika, a następnie wywoływał funkcje o nazwie length() oraz to_upper()
#Wynikiem funkcji length() jest długość słowa, natomiast to_upper() słowo napisane wielkimi literami.
#Następnie program ma wypisać wynik funkcji to_upper(), oraz podwojony iloczyn zmiennej uzyskanej w wyniku funkcji length().
length() {
  local word=$@
  local len=${#word}
  return $len
}
to_upper() {
  local word=$@
  local word_upper=${word^^}
  echo $word_upper
}

read -p "Podaj słowo:" word
to_upper $word
length $word
echo $(( $? * 2 )) # wartość zwrotu ostatnio wykonanej funkcji * 2
