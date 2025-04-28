#!/bin/bash
# Usage: ./script.sh hours worked_rate

hours=$1
rate=$2

if [ $hours -le 40 ]; then
    pay=$((hours * rate))
else
    overtime=$((hours - 40))
    overtime_pay=$((overtime * rate * 2))
    pay=$((40 * rate + overtime_pay))
fi

echo "Employee's pay: $pay"


#!/bin/bash
# Usage: ./script.sh num1 num2 num3

num1=$1
num2=$2
num3=$3

if [ $num1 -gt $num2 ] && [ $num1 -gt $num3 ]; then
    echo "$num1 is the largest"
elif [ $num2 -gt $num3 ]; then
    echo "$num2 is the largest"
else
    echo "$num3 is the largest"
fi


#!/bin/bash
# Usage: ./script.sh number

number=$1
sum=0

while [ $number -gt 0 ]
do
    digit=$((number % 10))
    sum=$((sum + digit))
    number=$((number / 10))
done

echo "Sum of digits: $sum"


#!/bin/bash
# Usage: ./script.sh file.txt

sed '/^$/d' "$1"



#!/bin/bash
# Usage: ./script.sh file.txt pattern1 pattern2 pattern3 ...

file=$1
shift
patterns="$@"

egrep "$patterns" "$file"


//(i) Write a shell script to perform arithmetic operations.
echo Enter two numbers to add
read a b
echo The addition of two number is $((a+b))
echo Enter two numbers to subtract
read a b
echo The addition of two number is $((a-b))
echo Enter two numbers to multiply
read a b
echo The addition of two number is $((a*b))
echo Enter two numbers to divide
read a b
echo The addition of two number is $((a/b))


//(iv) Write a shell script to determine a given year is leap year or not.
echo Enter a year
read y
year=$y
y=$(( $y % 4))
if [ $y -eq 0 ]
then
echo &quot;$year is a leap year&quot;
else
echo &quot;$year is not a leap year&quot;
fi



#!/bin/bash
# Menu-driven calculator using case statement

echo "Select operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Exit"

while true
do
    read -p "Enter your choice (1-5): " choice
    if [ "$choice" -eq 5 ]; then
        echo "Exiting..."
        break
    fi

    read -p "Enter first number: " num1
    read -p "Enter second number: " num2

    case $choice in
        1)
            result=$((num1 + num2))
            echo "Result: $num1 + $num2 = $result"
            ;;
        2)
            result=$((num1 - num2))
            echo "Result: $num1 - $num2 = $result"
            ;;
        3)
            result=$((num1 * num2))
            echo "Result: $num1 * $num2 = $result"
            ;;
        4)
            if [ $num2 -eq 0 ]; then
                echo "Division by zero is not allowed"
            else
                result=$((num1 / num2))
                echo "Result: $num1 / $num2 = $result"
            fi
            ;;
        *)
            echo "Invalid choice! Please choose a number between 1 and 5."
            ;;
    esac
done


#!/bin/bash
# Operations on directories

echo "Select an option:"
echo "1. Display name of current directory"
echo "2. Display list of directory contents"
echo "3. Create a new directory and write contents"
echo "4. Copy the directory to home directory"
echo "5. Exit"

while true
do
    read -p "Enter your choice (1-5): " choice

    case $choice in
        1)
            echo "Current directory: $(pwd)"
            ;;
        2)
            echo "Contents of the directory:"
            ls -l
            ;;
        3)
            read -p "Enter new directory name: " dir_name
            mkdir "$dir_name"
            echo "This is a test file" > "$dir_name/test.txt"
            echo "Contents written to $dir_name/test.txt"
            ;;
        4)
            read -p "Enter the directory to copy: " dir_to_copy
            cp -r "$dir_to_copy" ~/
            echo "$dir_to_copy has been copied to home directory."
            ;;
        5)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice! Please choose a number between 1 and 5."
            ;;
    esac
done



#!/bin/bash
# Check if directory or file exists, and create it if not

read -p "Enter the directory/file path: " path

if [ -e "$path" ]; then
    echo "$path exists."
else
    if [ ! -e "$path" ]; then
        if [[ "$path" == */ ]]; then
            mkdir -p "$path"
            echo "Directory $path created."
        else
            touch "$path"
            echo "File $path created."
        fi
    fi
fi



#!/bin/bash
# Compute power of first number raised to the second number

if [ $# -ne 2 ]; then
    echo "Please provide two integers as arguments."
    exit 1
fi

num1=$1
num2=$2

result=$((num1 ** num2))
echo "$num1 raised to the power of $num2 is: $result"


1.Write a shell script to search whether element is present is in the list or not
Program:
echo &quot;Enter elements&quot;
read else
echo &quot;Enter item to be searched&quot;
read item
flag=0
for e in $ele
do
if [ $e == $item ]
then
flag=1
break
fi
done

#!/bin/bash
# Find number of words, characters, and lines in a file using grep

read -p "Enter the file name: " filename

if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

words=$(grep -o -E '\w+' "$filename" | wc -l)
chars=$(grep -o -E '.' "$filename" | wc -l)
lines=$(grep -c '' "$filename")

echo "Number of words: $words"
echo "Number of characters: $chars"
echo "Number of lines: $lines"


#!/bin/bash
# Replace all occurrences of a particular word in a file using sed

read -p "Enter the file name: " filename

if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

read -p "Enter the word to replace: " old_word
read -p "Enter the new word: " new_word

sed -i "s/$old_word/$new_word/g" "$filename"
echo "Replaced all occurrences of '$old_word' with '$new_word' in $filename"



4.Write
a Shell
script to
calculate
Grade

Program:
read grade

if [ $grade -gt 90 ]
then

echo &quot;Grade O&quot;
elif [ $grade -gt 75 ]
then
echo &quot;Grade A&quot;
elif [ $grade -gt 60 ]
then
echo &quot;Grade B&quot;
elif [ $grade -gt 35 ]
then
echo &quot;Grade C&quot;
else
echo &quot;Failed&quot;
fi 




7.Write a shell script to print following pattern:

*
* *
* * *
* * * *

Program:
echo &quot;Enter Number of rows:&quot;
read rows
for ((i=0; i&lt;rows; i++))
do
for((j=i; j&lt;=rows; j++))
do
echo -n &quot; &quot;
done
for((k=0; k&lt;=i ; k++))
do
echo -n &quot;* &quot;
done
echo
done


8.Write
a shell
script to
perform
operations on directory like: display name of current directory; display list of directory contents;
create another directory, write contents on that and copy it to a suitable location in your home
directory; etc.
Program:

echo &quot;Current working directory is :&quot;

pwd
echo &quot;Content of current directory :&quot; ls

echo &quot;Creating another directory :&quot;
mkdir New_Folder
ls

cd New_Folder
echo &quot;Creating a file in New_Folder :&quot; ls
gedit new_file.txt

echo &quot; Content of the file is : cat new_file.txt&quot;
echo &quot; Copying the newly created file to /home directory&quot; cp
new_file.txt /home
cd
ls