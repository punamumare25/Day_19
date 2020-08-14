#!/bin/bash -x

echo "Welcome to Employee Wage Computation Program on Master Branch"

WAGE_PER_HOUR=20
FULL_TIME=8
PART_TIME=4
ABSENT=0
EMP_IS_FULLTIME=0
EMP_IS_PARTTIME=1
EMP_IS_ABSENT=2

sal=0
hour=0
day=0

function getWorkingHours()
{
	local attendance=$1

	case $attendance in
		$EMP_IS_FULLTIME)
		echo "$FULL_TIME"
		;;

		$EMP_IS_PARTTIME)
		echo "$PART_TIME"
		;;

		$EMP_IS_ABSENT)
		echo "$ABSENT"
		;;
	esac
}
while [[ $day -ne 20 && $hour -ne 100 ]]
do
	attendance=$((RANDOM%3))
	hourPerDay=$( getWorkingHours $attendance )
	hour=$(($hour+$hourPerDay))
	((day++))
	dailyWage[$day]=$((hourPerDay*WAGE_PER_HOUR))
	sal=$((sal+hourPerDay*WAGE_PER_HOUR));
done
echo ${!dailyWage[@]}
echo ${dailyWage[@]}
echo "Monthly Sal: " $sal
echo "Total Working Hours: "$hour
