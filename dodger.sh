#!/bin/bash

# dodger.sh
# Written by Josh Spicer (hello@joshspicer.com)

#### VARIABLES/CONSTANTS ####

#Keep track of time
oldTime=$((`date +%s` % 10))
newTime=$((`date +%s` % 10))

lane[0]="___@@@@@@@@@@@@@@@"
lane[1]="@@@___@@@@@@@@@@@@"
lane[2]="@@@@@@___@@@@@@@@@"
lane[3]="@@@@@@@@@___@@@@@@"
lane[4]="@@@@@@@@@@@@___@@@"
lane[5]="@@@@@@@@@@@@@@@___"

laneState="543210" # 6 Lanes on the screen at a time
		   # Each digit represents which type of lane is in that position.

person[0]=".&............."
person[1]="...&..........."
person[2]=".....&........."
person[3]=".......&......."
person[4]="..........&...."
person[5]=".............&."

playerState=3    # 1 of 6 possible player locations

# displays all the lanes
printLanes() {
	clear
	echo ${lane[${laneState:0:1}]}
	echo ${lane[${laneState:1:1}]}
	echo ${lane[${laneState:2:1}]}
	echo ${lane[${laneState:3:1}]}
	echo ${lane[${laneState:4:1}]}
	echo ${lane[${laneState:5:1}]}
}

# displays the player in the correct location


# Moves each lane down by 1
# Uses a random number to determine the newest lane
# Add newest lane to the front of laneState
# Remove the oldest lane from laneState
rotateLanes() {
	next="$((RANDOM % 6))"
	concat="$next$laneState"
	laneState="${concat:0:6}"
}

# Print the player in whichever location playerState says she's at.
printPlayer() {
	echo ${person[playerState]}

}


left() {
	echo "LEFT"
#	if ["$playerState" -le 0 ]
#	then
#		return
#	else
#		$((playerState - 1))
#	fi
}

right() {
	echo "RIGHT"
#	if ["$playerState" -ge 5]
#	then
#		return
#	else
#		$((playerState + 1))
#	fi
}


laneLoop() {
	printLanes
	rotateLanes
}

readInput() {
	read -s -n 1 -t 1 key #TODO this can't have the 1 sec delay
	case "$key" in
		'q') left;;
		'w') right;;
	esac
}

###### MAIN ######

while true; do

readInput
printPlayer

newTime=$((`date +%s` % 10))

# Things you wanna do every second
if [ "$newTime" != "$oldTime" ]; then
	oldTime=$newTime
	laneLoop
fi

done
