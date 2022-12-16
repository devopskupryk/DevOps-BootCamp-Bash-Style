#!/bin/bash
echo -e "\n NumberJack \n"
choice=0

while [[ $choice -ne 3 ]]; do
  echo "  
    PLAY : Hit 1 and enter.
    HELP : Hit 2 and enter.
    EXIT : Hit 3 and enter."
  echo "Enter your choice : "
  read -r choice
  
  if [[ $choice -eq 1 ]]; then
    index=0;
    code=0
    point=0
    echo "Enter any number between 0 and 9 : "
    read -r number 

    while [[ $code -eq 0 ]]; do 
      index=11; 
      mapfile -t random < <(shuf -i 0-9 -n 10)
      echo "${random[@]}"
    
      for i in {1..10}; do
        a[i]=$i
      done
      echo "${a[@]}"
      echo "Enter the index of your number : "
      read -t 10 -r index
    
      if [[ $? -gt 128 ]]; then
        code=1
        break
      fi
    
      if [[ ${random[$index-1]} -eq $number ]]; then
        echo "Great"
        ((point+=1))
      else
        code=1
        break
      fi
    done
  elif [[ $choice -eq 2 ]]; then
    echo "HELP: INSTRUCTIONS TO PLAY THE GAME. "
  else
    break
  fi

  if [[ $code -eq 1 ]]; then
    echo -e "\nGAME OVER\n"
    echo "You scored $point points"
  fi
done
