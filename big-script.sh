#!/bin/bash
option_a() {
  date +"%d/%m/%y %H:%M"
}

option_b() {
  ls -lh
}

option_c() {
  echo $USER
}

option_d() {
  mkdir $1
}

option_e() {
  rm $1
}

option_f() {
  cat $1 | head
}

option_g() {
  cat $1 | tail
}

option_h() {
  echo -e "Pomoc\nPomoc 2"
}

option_i() {
  ls -1 | wc -l
}

option_j() {
  ls *.txt
}

menu_1() {
  read -p "Podaj N:" N
  sum=0
  for ((i=1; i<=N; i++)) do
    sum=$((sum+i))
  done
  echo "Suma liczb od 1 do $N: $sum"
  done
  echo "Suma liczb od 1 do $N: $sum"
}

menu_2() {
  read -p "Podaj nazwę pliku:" nazwa_pliku
  tac $nazwa_pliku
}

if [ $# -eq 0 ]; then
  echo "Menu:"
  echo "1. Obliczenie sumy liczb:"
  echo "2. Odczytanie zawartości pliku:"
  echo "3. Sprawdzenie rodzaju ścieżki:"
  echo "4. Zliczenie plików i katalogów:"
  echo "5. Wyszukiwanie plików o podanej nazwie:"
  read -p "Podaj liczbę:" wybor
  case $wybor in
    1) menu_1 ;;
    2) menu_2 ;;
    3) menu_3 ;;
    4) menu_4 ;;
    5) menu_5 ;;
    *)
      echo "Wybrano nieistniejącą opcję"
    ;;
  esac
else
  case $1 in
    -a) option_a ;;
    -b) option_b ;;
    -c) option_c ;;
    -d)
      if [ $# -ge 2 ]; then
        option_d $2
      else
        exit
      fi
    ;;
    -e)
      if [ $# -ge 2 ]; then
        option_e $2
      else
        exit
      fi
    ;;
    -f)
      if [ $# -ge 2 ]; then
        option_f $2
      if [ $# -ge 2 ]; then
        option_f $2
      else
        exit
      fi
    ;;
    -g)
      if [ $# -ge 2 ]; then
        option_g $2
      else
        exit
      fi
    ;;
    -h) option_h ;;
    -i) option_i ;;
    -j) option_j ;;
    *)
      echo "Podano niepoprawny argument"
    ;;
  esac
fi
