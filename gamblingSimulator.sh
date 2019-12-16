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
		gameRecord["Day_$day"]=$outCome
	done
}

function dailyProfit(){
	for((j=1;j<=20;j++))
	do
		echo "Day_$j ${gameRecord[Day_$j]}"
	done 
}

function luckiestUnlukiest(){
	gameRecord[Day_0]=0
	for((j=1;j<=20;j++))
   do
		k=$(( $j - 1 ))
      gameRecord[Day_$j]=$(( ${gameRecord[Day_$j]} + ${gameRecord[Day_$k]} ))
		echo  "Day$j	"${gameRecord[Day_$j]}
   done | sort -k2 -nr |awk 'NR==20{print "Unluckiest: " $0}AND NR==1{print "Luckiest: " $0}'
}

function main(){
	dailyResult 
	dailyProfit
	luckiestUnlukiest
	echo "Total profit" $( printf "%s\n" ${gameRecord[@]} | awk '{sum+=$0}END{print sum}')
}
main
