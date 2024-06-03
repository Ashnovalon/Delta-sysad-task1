#!/bin/bash

#10 10 ** file


# Define your files
mentee_file="menteedom.txt"
mentor_file="mentordet.txt"
deregistered_file="~/mentees_deregistered.txt"  # List of mentees who have deregistered

# Read the list of deregistered mentees
deregistered_mentees=$(cut -f 1 -d ' ' "$deregistered_file")

# Iterate over each deregistered mentee
for mentee in $deregistered_mentees; do
    # Check if the mentee has deregistered from all domains
    if ! grep -q "$mentee" "$mentee_file"; then
        # If the mentee has deregistered from all domains, remove all traces
        sed -i "/$mentee/d" "$mentee_file"
        sed -i "/$mentee/d" "$mentor_file"
        echo "Removed all traces of $mentee from all files."
    else
        # If the mentee has not deregistered from all domains, remove specific traces
        sed -i "/$mentee/d" "$mentor_file"
        echo "Removed traces of $mentee from mentor file."
    fi
done


