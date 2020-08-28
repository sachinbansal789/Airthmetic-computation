#!/usr/local/bin/bash -x

#DICTIONARY
declare -A results

#ARRAY
declare -a array_result

read -p "Enter first number : " a       #Take inputs from user
read -p "Enter second number : " b
read -p "Enter third number : " c 

results["Result 1"]=$(( a + b * c ))	#Do each computation and store in dictionary		
results["Result 2"]=$(( a * b + c ))	#Computation 2
results["Result 3"]=$(( c + a / b ))    #Computation 3
results["Result 4"]=$(( a % b + c ))    #Computation 4 

for (( count=0; count<=3; count++))     #for loop to read dictionary's values into array
do
	
   array_result[$count]=${results["Result $((count+1))"]} 
	
done 

echo "Unsorted array of results : " ${array_result[@]}   #print unsorted array



for (( j=0; j<=2; j++ ))	        #for loop to sort the array's contents in ascending order
do
	for (( i=0; i<=2; i++ ))
	do	
		if [[ ${array_result[i]} -gt ${array_result[$((i+1))]} ]]
		then
			temp=${array_result[i]}    
			array_result[i]=${array_result[$((i+1))]}
			array_result[$((i+1))]=$temp
		fi 

	done
done

echo "Results in ascending order : " ${array_result[@]}  # Print sorted array
