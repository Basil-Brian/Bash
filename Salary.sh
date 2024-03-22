#!/bin/bash

# Function to calculate tax based on basic pay
calculate_tax() {
    if (( $1 > 70000 )); then
        tax=$(echo "scale=2; $1 * 0.25" | bc)
    elif (( $1 >= 15000 && $1 <= 70000 )); then
        tax=$(echo "scale=2; $1 * 0.15" | bc)
    else
        tax=0
    fi
    echo $tax
}

# Function to calculate net pay
calculate_net_pay() {
    net_pay=$(echo "scale=2; $1 - $2" | bc)
    echo $net_pay
}

# Main script starts here
echo "Enter employee name:"
read name

echo "Enter hours worked:"
read hours_worked

echo "Enter rate per hour:"
read rate_per_hour

# Calculate basic pay
basic_pay=$(echo "$hours_worked * $rate_per_hour" | bc)

# Calculate tax
tax=$(calculate_tax $basic_pay)

# Calculate net pay
net_pay=$(calculate_net_pay $basic_pay $tax)

# Display results
echo "Employee Name: $name"
echo "Basic Pay: $basic_pay"
echo "Tax: $tax"
echo "Net Pay: $net_pay"
