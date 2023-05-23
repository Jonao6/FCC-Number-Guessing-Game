#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
  echo -e "\nEnter your username:"
  read -r NAME

  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$NAME'")
  if [[ -z $PLAYER_ID ]]
  then
    echo -e "\nWelcome, $NAME! It looks like this is your first time here."
    INSERTED_PLAYERS=$($PSQL "INSERT INTO players(username) VALUES('$NAME')")
  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(player_id) FROM games INNER JOIN players USING(player_id) WHERE username='$NAME'")
    BEST_GAME=$($PSQL "SELECT MIN(attempts) FROM games INNER JOIN players USING(player_id) WHERE username='$NAME'")
    echo -e "\nWelcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
 fi

  GAMES "$NAME"
}


GAMES() {
  echo -e "\nGuess the secret number between 1 and 1000:"

  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$NAME'")

  RANDOM_NUMBER=$(( $RANDOM % 1000 + 1))
  for (( ATTEMPTS = 1; ; ATTEMPTS++ ))
  do
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    elif [[ $RANDOM_NUMBER -eq $GUESS ]]
    then
      echo -e "\nYou guessed it in $ATTEMPTS tries. The secret number was $RANDOM_NUMBER. Nice job!"
      GAME_DATA=$($PSQL "INSERT INTO games(player_id, attempts) VALUES($PLAYER_ID, $ATTEMPTS)")
      break
    elif [[ $RANDOM_NUMBER -gt $GUESS ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    else
      echo -e  "\nIt's lower than that, guess again:"
    fi
  done
}
MAIN_MENU
