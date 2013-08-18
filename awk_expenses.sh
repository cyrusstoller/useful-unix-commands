#!/bin/sh
# Credit: http://c2.com/doc/expense/

exec awk '
$1 ~ /^[A-Z]+[A-Z0-9]*$/ {
	if (sums[$1] == "" || $1 == "SUM") {
		sums[$1] = sum			# Define Symbol
		$1 = sum
		sum = 0
	}
	else {
		$1 = sums[$1]			# Dereference Symbol
	}
}

($1+0) != 0	{$1 = sprintf("%7.2f", $1)}	# Pretty Print
		{print}

$2 == "*"	{$1 *= $3}			# Explicit Calculations
$2 == "/"	{$1 /= $3}
$2 == "DB"	{$1 = -$1}
$2 == "CR"	{$1 = -$1}

NF == 0		{sum = 0}			# Implicit Summation
		{sum += $1}
' $1