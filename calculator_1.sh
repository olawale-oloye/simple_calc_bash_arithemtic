# !/usr/bin bash


# -----------------------------------------------------------
# Script Name: calculator.sh
# Description:
#   Simple calculator supporting add, subtract,
#   multiply and divide.
#
# Usage:
#   ./calculator.sh <operation> <num1> <num2>
#
# Operations:
#   a = add
#   s = subtract
#   m = multiply
#   d = divide
#
# Example:
#   ./calculator.sh a 5 3
#   Output: Result = 8
# -----------------------------------------------------------

# Using bash arithemtic $(()) - most common

# ---------------------------
# Functions
# ---------------------------

add() {
    result=$(($1 + $2))
    echo "Result = $result"
}

subtract() {
    result=$(($1 - $2))
    echo "Result = $result"
}

multiply() {
    result=$(($1 * $2))
    echo "Result = $result"
}

divide() {
    # check division by zero
    if [ "$2" -eq 0 ]; then
        echo "Error: Cannot divide by zero"
        exit 1
    fi

    result=$(($1 / $2))
    echo "Result = $result"
}


# ---------------------------
# Input validation
# ---------------------------

# check number of arguments
if [ "$#" -ne 3 ]; then
    echo "Error: Invalid number of arguments"
    echo "Usage: ./calculator.sh <a|s|m|d> <num1> <num2>"
    exit 1
fi


operation=$1
num1=$2
num2=$3


# check if numbers are valid integers
if ! [[ "$num1" =~ ^-?[0-9]+$ && "$num2" =~ ^-?[0-9]+$ ]]; then
    echo "Error: num1 and num2 must be integers"
    exit 1
fi


# ---------------------------
# Operation selection
# ---------------------------

case "$operation" in

    a)
        add "$num1" "$num2"
        ;;

    s)
        subtract "$num1" "$num2"
        ;;

    m)
        multiply "$num1" "$num2"
        ;;

    d)
        divide "$num1" "$num2"
        ;;

    *)
        echo "Error: Invalid operation"
        echo "Use:"
        echo " a = add"
        echo " s = subtract"
        echo " m = multiply"
        echo " d = divide"
        exit 1
        ;;

esac