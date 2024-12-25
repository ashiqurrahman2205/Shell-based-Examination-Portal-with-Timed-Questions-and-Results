#!/bin/bash

function show_menu() {
  clear
  echo -e "\e[1;32m*********************************************************\e[0m"
  echo -e "\e[1;34m*        WELCOME TO THE EXAMINATION LOGIN PORTAL        *\e[0m"
  echo -e "\e[1;32m*********************************************************\e[0m"
  echo
  echo -e "\e[1;33m1. Sign In\e[0m"
  echo -e "\e[1;36m2. Sign Up\e[0m"
  echo -e "\e[1;31m3. Exit\e[0m"
  echo -ne "\e[1;35mPlease Enter your choice: \e[0m"
  read choice
  case $choice in
    1) sign_in ;;
    2) sign_up ;;
    3) exit 1 ;;
    *) echo -e "\e[1;31mPlease Enter a Valid Choice\e[0m"
       sleep 2
       show_menu ;;
  esac
}

function sign_up() {
  clear
  echo -e "\e[1;32m--------- SIGN UP ---------\e[0m"
  echo -ne "\e[1;36mPlease Enter your Username: \e[0m"
  read username
  for i in ${usernames[@]}; do
    if [ "$username" = "$i" ]; then
      echo -e "\e[1;31mUsername already exists! Please enter a different username.\e[0m"
      sleep 3
      sign_up
    fi
  done

  while true; do
    echo -ne "\e[1;33mPlease Enter your Password (min 8 characters): \e[0m"
    read -s password
    echo
    if [ ${#password} -ge 8 ]; then
      break
    else
      echo -e "\e[1;31mPassword too short. Try again.\e[0m"
    fi
  done

  for attempt in {3..1}; do
    echo -ne "\e[1;36mConfirm your Password: \e[0m"
    read -s confirm_password
    echo
    if [ "$password" = "$confirm_password" ]; then
      echo "$username" >> username.csv
      echo "$password" >> password.csv
      echo -e "\e[1;32mAccount created successfully! Redirecting to main menu...\e[0m"
      sleep 3
      show_menu
    else
      echo -e "\e[1;31mPasswords do not match. Attempts left: $((attempt - 1))\e[0m"
    fi
    if [ $attempt -eq 1 ]; then
      echo -e "\e[1;31mToo many failed attempts. Returning to main menu...\e[0m"
      sleep 3
      show_menu
    fi
  done
}

function sign_in() {
  clear
  echo -e "\e[1;32m--------- SIGN IN ---------\e[0m"
  echo -ne "\e[1;36mPlease Enter your Username: \e[0m"
  read username
  usernames=($(cat username.csv))
  uid=0
  exist=0
  for i in $(seq 0 $((${#usernames[@]} - 1))); do
    if [ "${usernames[$i]}" = "$username" ]; then
      uid=$i
      exist=1
      break
    fi
  done
  if [ $exist -eq 0 ]; then
    echo -e "\e[1;31mUsername does not exist. Try again.\e[0m"
    sleep 2
    sign_in
  fi

  passwords=($(cat password.csv))
  og_password=${passwords[$uid]}
  for attempt in {3..1}; do
    echo -ne "\e[1;33mPlease Enter your Password: \e[0m"
    read -s password
    echo
    if [ "$password" = "$og_password" ]; then
      echo "User:$username logged in on $(date)" >> log.txt
      echo -e "\e[1;32mSigned in successfully! Redirecting to Test Page...\e[0m"
      sleep 3
      test
    else
      echo -e "\e[1;31mIncorrect password. Attempts left: $((attempt - 1))\e[0m"
    fi
    if [ $attempt -eq 1 ]; then
      echo -e "\e[1;31mToo many failed attempts. Returning to main menu...\e[0m"
      sleep 3
      show_menu
    fi
  done
}

function test() {
  clear
  echo -e "\e[1;32m*********************************************************\e[0m"
  echo -e "\e[1;34m*                      TEST PORTAL                      *\e[0m"
  echo -e "\e[1;32m*********************************************************\e[0m"
  echo
  echo -e "\e[1;33m1. Take Test\e[0m"
  echo -e "\e[1;36m2. Go to Home Page\e[0m"
  echo -e "\e[1;31m3. Exit\e[0m"
  echo -ne "\e[1;35mPlease Enter your choice: \e[0m"
  read choice
  case $choice in
    1) take_test ;;
    2) show_menu ;;
    3) exit 1 ;;
    *) echo -e "\e[1;31mInvalid choice. Redirecting...\e[0m"
       sleep 2
       test ;;
  esac
}

function take_test() {
  clear
  echo -e "\e[1;32m*********************************************************\e[0m"
  echo -e "\e[1;34m*               WELCOME TO THE TEST !!!                 *\e[0m"
  echo -e "\e[1;32m*********************************************************\e[0m"
  echo
  echo -e "\e[1;36mInstructions:\e[0m"
  echo -e "\e[1;33m1. The test consists of 10 questions, each worth 1 mark.\e[0m"
  echo -e "\e[1;33m2. You will have 10 seconds to answer each question.\e[0m"
  echo -e "\e[1;35mPress Enter to begin.\e[0m"
  read
  l=$(cat questionbank.txt | wc -l)
  >userans.txt
  for i in $(seq 5 5 $l); do
    echo
    head -$i questionbank.txt | tail -5
    for j in $(seq 10 -1 0); do
      echo -ne "\r\e[1;36mEnter the correct answer ($j seconds remaining): \e[0m"
      read -t 1 ans
      if [ ${#ans} -ne 0 ]; then
        break
      fi
    done
    if [ ${#ans} -ne 0 ]; then
      echo "$ans" >> userans.txt
    else
      echo "No answer" >> userans.txt
    fi
  done
  echo -e "\e[1;33mThe results are generating...\e[0m"
  sleep 3
  result
}

function result() {
  clear
  useranswers=($(cat userans.txt))
  correctanswers=($(cat correctans.txt))
  len=$(cat correctans.txt | wc -l)
  score=0
  for ((i = 0; i < len; i++)); do
    if [ "${useranswers[$i]}" = "${correctanswers[$i]}" ]; then
      score=$((score + 1))
    fi
  done
  echo -e "\e[1;32m***************************************\e[0m"
  echo -e "\e[1;34m*                                     *\e[0m"
  echo -e "\e[1;34m*           🎉 RESULT 🎉              *\e[0m"
  echo -e "\e[1;34m*                                     *\e[0m"
  echo -e "\e[1;32m***************************************\e[0m"
  echo
  echo -e "\e[1;33mYour score: $score\e[0m"
  echo -e "\e[1;36m---------------------------------------\e[0m"
  echo -e "\e[1;36m1. Go back to main menu\e[0m"
  echo -e "\e[1;36m2. Take test again\e[0m"
  echo -e "\e[1;31m3. Exit\e[0m"
  echo -ne "\e[1;35mPlease enter your choice: \e[0m"
  read opt
  case $opt in
    1) echo "The score of $username on $(date) is $score" >>mark_record.txt
       show_menu ;;
    2) echo "The score of $username on $(date) is $score" >>mark_record.txt
       test ;;
    3) echo "The score of $username on $(date) is $score" >>mark_record.txt
       exit 1 ;;
    *) echo -e "\e[1;31mPlease Enter a Valid Option.\e[0m"
       result ;;
  esac
}

show_menu
