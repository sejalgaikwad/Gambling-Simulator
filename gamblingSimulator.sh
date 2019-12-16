#!/bin/bash -x

echo "Welcome to Gambilng"
declare -A gameRecord


#constant
BET=1
STAKE=100
DAYS=20

function dailyResult(){
for(( day=1; day<=$DAYS; day++))
do
	STAKE=100
	win=0
	loss=0
	LOW_LIMIT=$(( $STAKE / 2 ))
	HIGH_LIMIT=$(($STAKE / 2 + $STAKE))

	while [[ $LOW_LIMIT -lt $STAKE && $HIGH_LIMIT -gt $STAKE ]]
	do
		winLossResult=$((RANDOM%2))
		if [ $winLossResult -eq 1 ]
		then
			STAKE=$(($STAKE+1))
			win=$(($win+1))
		else
			STAKE=$(($STAKE-1))
			loss=$(($loss-1))
		fi
	done
	outCome=$(( $STAKE - 100 ))
	gameRecord["Day_$day"]=$win" "$loss
	done
}

dailyResult

for i in ${!gameRecord[@]}
do
	echo "$i ${gameRecord[$i]}"
done | sort -k2 -n
