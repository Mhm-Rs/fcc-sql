#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Mhm Salon ~~~~~\n"

SERVICES=$($PSQL "SELECT * FROM services")
NUMBER_SERVICES=$(echo "$SERVICES" | wc -l)

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Hello! How may I help you?" 
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
  echo -e "Please enter a number.\n"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
   *) 
     if (( $SERVICE_ID_SELECTED >= 1  && $SERVICE_ID_SELECTED <= $NUMBER_SERVICES ));
     then
        BOOK_APPOINTMENT $SERVICE_ID_SELECTED 
     else
        MAIN_MENU "Please enter a valid input." 
     fi ;;

esac


}

BOOK_APPOINTMENT() {
  SERVICE_ID=$1
  SERVICE_NAME_SELECTED=$($PSQL "SELECT name from services where service_id = $SERVICE_ID")
  SERVICE_NAME_FORMATTED=$(echo "$SERVICE_NAME_SELECTED" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')
  echo -e "\nYou have selected the hair$SERVICE_NAME_SELECTED service."
  echo -e "\nPlease enter your phone number."
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
      echo -e "\nIt seems that we do not have you as a registered customer. Please enter your name."
      read CUSTOMER_NAME

      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME ?"
  read SERVICE_TIME

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$SERVICE_ID)")

  if [[ $INSERT_APPOINTMENT_RESULT = 'INSERT 0 1' ]]
  then
     echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME."
  else
     echo -e "\nInternal Server Error. Please try again later."
  fi
  exit
}

MAIN_MENU
