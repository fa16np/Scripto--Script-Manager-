#!/bin/bash

#Author: A*7065-/726568*
#Actual Code
a=0
c=$'\n'




while :
do

#Making a Temporary Data File
touch Sdata.txt

declare -a choices

unset choices

choices=$(ls | grep '.sh')

printf "%s" "${choices[@]}"  > Sdata.txt

readarray choices < Sdata.txt

rm Sdata.txt

echo "                        ------Scripts------- $c"

if [ ${#choices[@]} -eq 0 ]
then
        echo "No Scripts here Yet!"
else
	for i in "${!choices[@]}"
	do
        printf "%s %s" "$i" "${choices[$i]}"

	done
fi

echo "$c                   -----Options (commands)------ $c "

printf "%s \n" "'r' (RUN)  |  'o' (OPEN)  | 'm' (MAKE NEW) |  'd' (DELETE)  |  'e'  (EXIT)"
echo "$c"

read -p "Enter a command from options above and press 'Enter' : $c" input

#Wrong inputnumber
if [ "$input" != "r" ] && [ "$input" != "o" ] && [ "$input" != "m" ] && [ "$input" != "d" ] && [ "$input" != "e" ]
then
  rd=$((1 + RANDOM % 4))
  if [ $rd -eq 1 ]
  then
	printf "Invalid Command, Deleting all files on this system $c Chill!, Just Kidding :D! $c"
elif [ $rd -eq 2 ]
then
printf "Invalid Command. $c If you are Thor and this program is his hammer, You are not Worthy! $c"
elif [ $rd -eq 3 ]
then
printf "Srsly?! $c Its an Invalid Command $c"
else

printf "Invalid Command, This shows you are not a good person! $c And YES I am judging you and you can do nothing!$c"
fi
fi


#Exit condition

if [ "$input" == "e" ]
then
  echo "Bye.. Thanks!..*Awkward Silence*..."
	break
fi

#Script Operations

	#Run script
	if [ "$input" == "r" ]
  	then
		read -p "What is the number of the Script(From options above): $c" nop

		if [ $nop -eq $nop 2>/dev/null ]
	        then
			fil="${choices[$nop]}"
			if [ -e $fil ]
			then
				read -p "Give positional parameters for the file (seperated by spaces): $c" pm
				echo "${choices[$nop]}"
        			echo "--------------OUTPUT-------------------"
				./${choices[$nop]} $pm
     			        echo "---------------------------------------"
			else
				echo "You are Funny!, There is no such file here! $c"
 		fi
  else
    echo "That was not a number!!, Index Arrays dont take strings as indexes"
   fi
		echo "$c Try running actually instead of just running a program!, Its good for health!$c"
	fi

	#Open Script
	if [ "$input" == "o" ]
  	then
		read -p "What is the number of Script: $c" nop

    if [ $nop -eq $nop 2>/dev/null ]
    then
			fil="${choices[$nop]}"
		if [ -e $fil ]
		then

			vim ${choices[$nop]}
       echo "Success!"
    		else
      		echo "404 File not found! $c"
    		fi
    else
      echo "That was not a number!!, Index Arrays dont take strings as indexes"
     fi
      echo "$c SOMETHING GOOD WILL HAPPEN TO YOU TODAY! :) $c"
  	fi

	#Create a script
	if [ "$input" == "m" ]
  	then

		read -p "Write a name for a Script with extention(.sh): $c" pp

		if [ -e "$pp" ]
		then
			echo "file already exists"
		else
			#creating file
			touch $pp

			#Execute permission
      chmod +x $pp


			toadd=$pp

			choices+=("$toadd")

			echo "Success!"

      read -p "$c Do you want to open the file you just created? $c ('Y' for yes/ 'N' for no) $c" df
      if [ "$df" == "Y" ] || [ "$df" == "y" ]
      then
      echo "$pp"
      vim $pp
fi

    fi
    echo "$c Did this boosted your creativity?, I am quite sure it Did! $c"
  	fi

	#Deleting a script
	if [ "$input" == "d" ]
	then
		 read -p "What is the name of Script: $c" nn


                if [ -e "$nn" ]
                then
			read -p "Are you sure, You want to delete $nn $c (y if yes/n if no): $c" mnb
                    	if [ $mnb == "y" ]
			then
		    		rm $nn
				echo "Success!$c"
			else
				echo "Not deleted!$c"
			fi

		else
                echo "404 File not found! $c"
                fi
    echo "$c Do you have any regrets about it?"
    echo "YOU SHOULD BE GRATEFUL WITH WHAT YOU HAVE! :) $c"
	fi

read -p "Press any key to continue.... $c" jk

done
