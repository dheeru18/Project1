#!/bin/bash
#Simple line count example, using bash
# usage: ./line_count.sh file 
#--------------------------------

# LInk fileedescriptor 10 with stdin
exec 10<&0
#stdin replaced with a file supplied as a first argument
exec < $1
#remember the name of the input file
in=$1
#init
file="arument.sh"
let count=0
#this while loop iterates over all lines of the file
while read LINE
do
	# incease line counter
	((count++))
	# write current line to a tmp file same $file (not needed for counting)
	echo $LINE > $file
	# this checks the return code of echo (not needed for writing; just for demo)
	if [ $? -ne 0 ]
	then echo "Error in writing to file ${file}; check its permission!"
	fi
done
echo "Number of lines; $count"
echo "The last line of the file is: `cat ${file}`"

# Note: you can achive the same by just the tool wc like this
echo "Expected number of lines: `wc -l $in`"

#restore stdin from filedescrotor 10
# and close file filedescriptor 10
exec 0<&10 10<&-



 


