#!/bin/bash
#Wyświetli 7,5 i 3 kolumnę pierwszej linii z pliku /etc/passwd, rozdzielając je znakiem spacji.
echo "`cut -d ':' -f 7 /etc/passwd | head -n 1` `cut -d ':' -f 5 /etc/passwd | head -n 1` `cut -d ':' -f 3 /etc/passwd | head -n 1`" 

#Pobierze liczbę całkowitą, a następnie wyświetli komunikat czy liczba jest większa od zera czy nie.
read -p "Podaj liczbę" liczba
if [ "$liczba" -gt "0" ]; then
  echo "Liczba $liczba jest większa od zera"
else
  echo "Liczba $liczba jest mniejsza od zera"
fi

#Pobierze dwie liczby całkowite większe od zera i wyświetli ich średnią arytmetyczną, która jest liczbą całkowitą.
#W przypadku podania liczby ujemnej program powinien wypisać komunikat: BŁĄD

read -p "Podaj pierwszą liczbę:" liczba1
read -p "Podaj drugą liczbę:" liczba2
if [ "$liczba1" -lt "0" ] || [ "$liczba2" -lt "0" ]; then
  echo "BŁĄD"
else
  echo $(((liczba1 + liczba2) / 2))
fi

#Pobieramy liczbę całkowitą od użytkownika
#Jeżeli liczba ta jest podzielna przez 15 wypisujemy na ekran "FizzBuzz" (wraz z cudzysłowiami)
#W przeciwnym przypadku jeżeli liczba ta jest podzielna przez 3 wypisujemy na ekran "Fizz" (wraz z cudzysłowami)
#W przeciwnym przypadku jeżeli liczba ta jest podzielna przez 5 wypisujemy na ekran "Buzz" (wraz z cudzysłowiami)
#W przeciwnym przypadku wypisujemy tę liczbę z cudzysłowiami np: "17"
read -p "Podaj pierwszą liczbę:" liczba
if [ $(( $liczba % 15 )) -eq 0 ]; then
  echo "\"FizzBuzz\""
elif [ $(( $liczba % 3 )) -eq 0 ]; then
  echo "\"Fizz\""
elif [ $(( $liczba % 5 )) -eq 0 ]; then
  echo "\"Buzz\""
else
  echo "\"$liczba\""
fi

#Pobierze dwa ciągi tekstowe i wypisze napis większy od niego.
#Wskazówka: Należy skorzystać z podwójnych nawiasów kwadratowych [[]] oraz operatora większości (>).
read -p "Podaj pierwszy ciąg tekstowy:" tekst1
read -p "Podaj drugi ciąg tekstowy:" tekst2
if [[ $tekst1 > $tekst2 ]]; then
  echo "$tekst1"
else
  echo "$tekst2"
fi

#Napisz program, który pobierze literkę z alfabetu i wypisze komunikat czy litera ta jest samogłoską czy nie.

read -p "Podaj literę alfabetu:" litera
if [[ $litera != [a-zA-Z] ]]; then
  exit 5
fi
if [[ $litera == [AEIOUYaeiouy] ]]; then
  echo "Litera '$litera' jest samogłoską"
else
  echo "Litera '$litera' nie jest samogłoską"
fi

#Dla podanej liczby z odpowiedniego zakresu wyświetli jaki to miesiąc i ile ma on dni.
#Zakładamy, że rok tutaj nie jest przestępny.
read -p "Podaj liczbę od 1 do 12:" liczba
if [ $liczba -gt 0 ] && [ $liczba -lt 13 ]; then
  case $liczba in 
  1)
    echo "Styczeń: 31 dni"
    ;;
  2)
    echo "Luty: 28 dni"
    ;;
  3)
    echo "Marzec: 31 dni"
    ;;
  4)
    echo "Kwiecień: 30 dni"
    ;;
  5)
    echo "Maj: 31 dni"
    ;;
  6)
    echo "Czerwiec: 30 dni"
    ;;
  7)
    echo "Lipiec: 31 dni"
    ;;
  8)
    echo "Sierpień: 31 dni"
    ;;
  9)
    echo "Wrzesień: 30 dni"
    ;;
  10)
    echo "Październik: 31 dni"
    ;;
  11)
    echo "Listopad: 30 dni"
    ;;
  12)
    echo "Grudzień: 31 dni"
    ;;
  esac
else
    echo "BŁĄD"
fi

#Pobierze ciąg tekstowy, który będzie nazwą miesiąca, a następnie liczbę całkowitą reprezentująca dzień.
#W wyniku program ma wyświetlić astronomiczną porę roku dla wczytanego dnia i miesiąca.
read -p "Podaj miesiąc:" miesiac
case $miesiac in
  Styczeń|Luty|Marzec|Kwiecień|Maj|Czerwiec|Lipiec|Sierpień|Wrzesień|Październik|Listopad|Grudzień)
    read -p "Podaj dzień:" dzien
    if [ $dzien -gt 0 ] && [ $dzien -lt 32 ]; then
	    if [ $dzien -gt 20 ]; then
		  case $miesiac in
		    Grudzień|Styczeń|Luty)
			  echo "Zima"
			;;
		    Marzec|Kwiecień|Maj)
			  echo "Wiosna"
			;;
		    Czerwiec|Lipiec|Sierpień)
			  echo "Lato"
			;;
		    Wrzesień|Październik|Listopad)
			  echo "Jesień"
			;;
		  esac
		else
		  case $miesiac in
		    Styczeń|Luty|Marzec)
			  echo "Zima"
			;;
		    Kwiecień|Maj|Czerwiec)
			  echo "Wiosna"
			;;
		    Lipiec|Sierpień|Wrzesień)
			  echo "Lato"
			;;
		    Październik|Listopad|Grudzień)
			  echo "Jesień"
			;;
		  esac
		fi
    else
      echo "BŁĄD"
    fi
  ;;
  *)
    echo "BŁĄD"
  ;;
esac

#Wczyta trzy ciągi tekstowe i wypisze je od najmniejszego ciągu do największego.
read -p "Podaj pierwszy ciag tekstowy:" tekst1
read -p "Podaj drugi ciag tekstowy:" tekst2
read -p "Podaj trzeci ciag tekstowy:" tekst3
if [[ $tekst1 < $tekst2 && $tekst2 < $tekst3 ]]; then
  echo $tekst1 $tekst2 $tekst3
elif [[ $tekst1 < $tekst3 && $tekst3 < $tekst2 ]]; then
  echo $tekst1 $tekst3 $tekst2
elif [[ $tekst2 < $tekst1 && $tekst1 < $tekst3 ]]; then
  echo $tekst2 $tekst1 $tekst3
elif [[ $tekst2 < $tekst3 && $tekst3 < $tekst1 ]]; then
  echo $tekst2 $tekst3 $tekst1
elif [[ $tekst3 < $tekst1 && $tekst1 < $tekst2 ]]; then
  echo $tekst3 $tekst1 $tekst2
else
  echo $tekst3 $tekst2 $tekst1
fi

#Pola szachownicy niech będą numerowane od 1 do 8 (w poziomie i pionie).
#Pobierze od użytkownika cztery liczby, reprezentujący odpowiednio pierwsze pole oraz drugie.
#Wynikiem programu ma być wartość True, jeżeli pola są w tym samym kolorze lub False w przeciwnym przypadku.
read -p "Podaj x1:" x1
read -p "Podaj y1:" y1
read -p "Podaj x2:" x2
read -p "Podaj y2:" y2
if [[ $x1 != [1-8] || $y2 != [1-8] || $x2 != [1-8] || $y2 != [1-8] ]]; then
  echo "BŁĄD"
  exit
fi
suma1=$(($x1 + $y1))
suma2=$(($x2 + $y2))
if [[ $(((suma1 % 2) == 0)) -eq $(((suma2 % 2) == 0)) ]]; then 
  echo "True"
else
  echo "False"
fi

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
