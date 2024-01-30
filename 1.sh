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
