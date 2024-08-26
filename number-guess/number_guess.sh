#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID_SELECTED=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID_SELECTED ]]
then
    # user does not exist yet in db
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
    USER_INFO=$($PSQL "SELECT COUNT(game_id), MIN(guesses) FROM users INNER JOIN games USING(user_id) WHERE user_id=$USER_ID_SELECTED")
    echo "$USER_INFO" | while IFS="|" read NUMBER_GAMES BEST_GAME
    do
        echo "Welcome back, $USERNAME! You have played $NUMBER_GAMES games, and your best game took $BEST_GAME guesses."
    done
fi

NUM_GUESSES=1
NUMBER_TO_GUESS=$((1 + $RANDOM % 1000))

echo -e "Guess the secret number between 1 and 1000:"
read GUESS

until [ $GUESS == $NUMBER_TO_GUESS ];
do
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
        echo "That is not an integer, guess again:"
    elif [[ $GUESS -gt $NUMBER_TO_GUESS ]]
    then
        echo "It's lower than that, guess again:"
    elif [[ $GUESS -lt $NUMBER_TO_GUESS ]]
    then
        echo "It's higher than that, guess again:"
    fi
    read GUESS
    NUM_GUESSES=$(($NUM_GUESSES + 1))
done

# save to db
USER_ID_SELECTED=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
INSERT_RESULTS=$($PSQL "INSERT INTO games(guesses, user_id) VALUES($NUM_GUESSES,$USER_ID_SELECTED)") 
echo "You guessed it in $NUM_GUESSES tries. The secret number was $NUMBER_TO_GUESS. Nice job!"

