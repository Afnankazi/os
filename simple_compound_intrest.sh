
echo "Enter Principal Amount:"
read principal

echo "Enter Rate of Interest (in %):"
read rate

echo "Enter Time (in years):"
read time

# Simple Interest calculation
simple_interest=$((principal * rate * time / 100))

# Compound Interest calculation (approximate for simple Bash)
compound_amount=$(echo "$principal * (1 + $rate/100)^$time" | bc -l)
compound_interest=$(echo "$compound_amount - $principal" | bc)

# Output
echo "Simple Interest is: $simple_interest"
echo "Compound Interest is: $compound_interest"
