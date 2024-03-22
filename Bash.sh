#!/bin/bash

# Prompt the user for employee name
read -p "Enter employee name: " employee_name

# Prompt the user for hours worked
read -p "Enter hours worked: " hours_worked

# Input validation for hours worked (positive number)
while [[ ! "$hours_worked" =~ ^[0-9]+$ ]]; do
  read -p "Invalid input. Enter hours worked (positive number): " hours_worked
done

# Prompt the user for rate per hour
read -p "Enter rate per hour: " rate_per_hour

# Input validation for rate per hour (positive number)
while [[ ! "$rate_per_hour" =~ ^[0-9.]+$ ]]; do
  read -p "Invalid input. Enter rate per hour (positive number): " rate_per_hour
done

# Calculate basic pay
basic_pay=$(echo "$hours_worked * $rate_per_hour" | bc)

# Calculate tax based on basic pay
if [[ $basic_pay -gt 70000 ]]; then
  tax=$(echo "$basic_pay * 0.25" | bc)
elif [[ $basic_pay -gt 15000 ]]; then
  tax=$(echo "$basic_pay * 0.15" | bc)
else
  tax=0
fi

# Calculate net pay
net_pay=$(echo "$basic_pay - $tax" | bc)

# Display the results
echo ""
echo "Employee Name: $employee_name"
echo "Basic Pay: $$basic_pay"  # Use $ for variable in string
echo "Tax: $$tax"
echo "Net Pay: $$net_pay"

echo ""
echo "**Note:** This script assumes 'bc' calculator is available."
