#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -n $1 ]]
then
    INPUT=$1
    # get the value of the element, whether argument is int or string
    if [[ $INPUT =~ ^[0-9]+$ ]]
    then
        ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number = $INPUT")
    else
        ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol = '$INPUT' OR name = '$INPUT'")
    fi

    # if value was found, display it
    if [[ -n $ELEMENT ]]
    then
        echo $ELEMENT | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
        do
          PROPERTIES=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
          echo $PROPERTIES | while IFS="|" read ATOMIC_MASS MPOINT BPOINT TYPE
          do
              echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPOINT celsius and a boiling point of $BPOINT celsius."
          done
        done
    # if not, display error
    else
        echo "I could not find that element in the database."
    fi
else 
    echo "Please provide an element as an argument."
fi