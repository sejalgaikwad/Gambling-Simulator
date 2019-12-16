#!/bin/bash -x

echo "Welcome to Gambilng"

#constant
BET=1
STAKE=100
LOW_LIMIT=$(( $STAKE / 2 ))
HIGH_LIMIT=$(($STAKE / 2 + $STAKE))

function dailyResult(){
	while [[ $LOW_LIMIT -lt $STAKE && $HIGH_LIMIT -gt $STAKE ]]
	do
		winLossResult=$((RANDOM%2))
		if [ $winLossResult -eq 1 ]
		then
			STAKE=$(($STAKE+1))
		else
			STAKE=$(($STAKE-1))
		fi
	done
	echo "Stake:- "$STAKE
}

dailyResult
