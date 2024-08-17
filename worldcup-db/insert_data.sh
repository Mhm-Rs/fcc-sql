#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE TABLE games, teams

# insert teams
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINGOALS OPPGOALS
do
  if [[ $YEAR != year ]] 
  then
      # insert every winner and opponent team in the db. If already inserted, the UNIQUE clause will reject insert
      INSERT_TEAM_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      INSERT_TEAM_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
  fi
done

# insert games
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINGOALS OPPGOALS
do
  if [[ $YEAR != year ]] 
  then
      # get winner_id and opponent_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

      # insert game
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINGOALS, $OPPGOALS)")
      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted $ROUND $YEAR into games
      fi
  fi
done
