#write script (#! /bin/bash)
#make script executable
chmod +x script.sh
#execute script
./script.sh

#redirect
###  > redirects the output of a command to a file, replacing the existing contents of the file.
###  >> redirects the output of a command to a file, appending the output to the existing contents of the file.

echo "hello there!" > file.txt
cat file.txt >> collect.txt
cat file.txt | grep word > wordtext.txt


#comments
: 'This
is used for multiple lines of comments
blablabla'

cat << example #any variable possible
this is a text displayed by script
and another line
example

###conditional statements###
##example1##
#set variable
count=10

if [ $count < 9 ]
#if count equals 10
# < lower than
# > greater than
# -eq equal
# -ne not equal
# -gt greater than
# -lt less than
# -a and
then
      echo "the first condition is true"

elif [[ $count <= 9 ]]
then  echo "the second condition is true"

else
      echo "the condition is false"
fi

##################

age=10

if [ '$age' -gt 18 ] && [ '$age' -lt 40]
#if [ '$age' -gt 18 -a  '$age' -lt 40]
# -a = and
#if [ '$age' -gt 18 -o  '$age' -lt 40]
# -o = or
then
      echo "Age is correct"
else
      echo "Age is not correct"
fi

########
$ false || echo "Oops, fail"
Oops, fail

$ true || echo "Will not be printed"
$

$ true && echo "Things went well"
Things went well

$ false && echo "Will not be printed"
$

$ false ; echo "This will always run"
This will always run

#&& = executes only if the previous command succeeded successfull
#|| = if the first command succeed the second will never be executed
#;  = just a separator which doesn't care what happend to the command before



##LOOPS##

number=1

while [ $number -lt 10 ]
#until [ $number -ge 10 ]
do
      echo "$number"
      number=$(( number+1 ))
done

######
for i in 1 2 3 4 5
#for i in {0..20..2}
#{start..ending..increment}
do
    echo $i
done

###########
#print 1 to 4
for (( i = 0; i < 5; i++ ))
#for i in 1 2 3 4 5
#for i in {0..20..2}
#{start..ending..increment}
do
    echo $i
done

######
#break loop at condition -gt 5
for (( i = 0; i <= 10; i++ ))
do
    if [ $i -gt 5 ];
    then
        break
    fi
    echo $i
done

#######
#breaks at 3 and 7 then continues
for (( i = 0; i <= 10; i++ ))
do
    if [ $i -eq 3 ] || [ $i -eq 7 ]
    then
        continue
    fi
    echo $i
done



#######Script Input#########

echo $1 $2 $3
#command: ./script.sh VARIABLE1 VARIABLE2 VARIABLE3
#sets the variables in order of Input

args=("$@")
#unlimited inputs

echo ${args[0]} ${args[1]} ${args[2]}
#prints input 1,2 and 3
#count starts at 0

echo $@
#print unlimited inputs

echo $#
#print out count of entered inputs

###Read from files###
while read line
do
      echo "$line"
done < "${1:-/dev/stdin}"

#command: test.sh <filename>
#prints each line of targeted file


###Script Output###

ls -al 1>stdout.log 2>stder.log
#redirect stdout and stder to different files

ls -al >ls.log 2>&1
#redirect out and err to same file

ls -al >&ls.log
#shortcut for redirect out and err to same file


########EXPORT########
#send output from one script to another script

MESSAGE="Hello there!"
export MESSAGE
./test2.sh

#exports the MESSAGE variable to test2.#!/bin/sh

#content test2.sh
#echo "The message from test is : $MESSAGE"

#prints out echo+variable from test.sh


######STRING PROCESSING######

echo "enter 1st string"
read st1
#"read" lets you enter values for variables

echo "enter 2nd string"
read st2

if [ "$st1" == "$st2" ]
then
      echo "both strings match"
else
      echo "strings do not match"
fi

#########################
echo "enter 1st string"
read st1
#"read" lets you enter values for variables

echo "enter 2nd string"
read st2

if [ "$st1" \< "$st2" ]
#\< = if st1 smaller than st2
then
      echo "$st1 is smaller than $st2"

elif [ "$st1" \> "$st2" ]
then
      echo "$st2 is bigger than $st1"

else
      echo "both strings are equal"
fi

##########

c=$st1$st2
echo $c
#prints out both strings

echo ${st1^}
#capital first letter
echo ${st1^^}
#capital whole string
echo ${st1^L}
#capital letter "l"


####NUMBERS AND ARITHMETICS#####

n1=4
n2=20

echo $(( n1 + n2 ))
echo $(( n1 - n2 ))
echo $(( n1 * n2 ))
echo $(( n1 / n2 ))

echo $(expr $n1 + $n2 )
#now associated with expr
#############################

echo "Enter Hex Number of your choice"
read Hex

echo -n "The decimal value of $Hex is : "

echo "obase=10; ibase=16; $Hex" | bc

##############
#Declare Command#
