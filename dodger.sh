#!/bin/bash

#### VARIABLES/CONSTANTS ####

lane[0]="___@@@@@@@@@@@@@@@"
lane[1]="@@@___@@@@@@@@@@@@"
lane[2]="@@@@@@___@@@@@@@@@"
lane[3]="@@@@@@@@@___@@@@@@"
lane[4]="@@@@@@@@@@@@___@@@"
lane[5]="@@@@@@@@@@@@@@@___"

laneState="543210" # 6 Lanes on the screen at a time
		   # Each digit represents which type of lane is in that position.

playerState="0"    # 1 of 6 possible player locations

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
rotateLanes() {
 next="$((RANDOM % 6))"
echo $next
echo $laneState
 concat="$next$laneState"
 laneState="${concat:0:6}"
 echo $laneState

 }


###### MAIN ######

while true; do

# read -s -n 1 key
# case "$key" in
#    '<') left;;
#    '>') right;;


printLanes
rotateLanes
# printPlayer
sleep 2


done
