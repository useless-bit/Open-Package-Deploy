#!/bin/bash

# Function to generate a random alphanumeric string
generate_random_string() {
   tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 64
}

file="example.env"
declare -A processed_variables

# Read the file line by line
while read -r line; do
   # Check if the line contains an assignment (i.e., has an equal sign)
   if [[ $line == *"="* ]]; then
       key="${line%%=*}"

       # If the variable was already processed and assigned a value, skip this line
       if [ -n "${processed_variables[$key]}" ]; then
           continue
       fi

       # Generate a new random string
       random_value=$(generate_random_string)
       processed_variables["$key"]=$random_value

       # Replace REPLACE_ME with the generated random string only in lines with assignments
       echo "${line//REPLACE_ME/$random_value}"
   else
       # Output non-assignment lines as they are
       echo "$line"
   fi
done < "$file" > .env