#!/bin/bash -x

echo "Welcome to Gambilng"

#constant
BET=1
STAKE=100


winLossResult=$((RANDOM%2))

if [ $winLossResult -eq 1 ]
then
	echo "Win"
else
	echo "Loss"
fi
