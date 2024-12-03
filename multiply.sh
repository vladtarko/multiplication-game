#!/bin/bash

# Initialize arrays
declare -a x
declare -a y
declare -a score
declare -a howfast

# Generate 10 random multiplication problems
for i in {0..9}; do
    x[i]=$((RANDOM % 8 + 2))  # Random number between 2 and 9
    y[i]=$((RANDOM % 8 + 2))
done

# Total score and timing variables
total_score=0
total_time=0

# Main game loop
for i in {0..9}; do
    start_time=$(date +%s.%N)
    
    # Ask multiplication problem
    read -p "How much is ${x[i]} x ${y[i]}? " user_answer
    
    # Calculate correct answer
    correct_answer=$((x[i] * y[i]))
    
    # Check the answer
    if [[ "$user_answer" -eq "$correct_answer" ]]; then
        echo "Correct!"
        score[i]=1
    else
        echo "Wrong! Correct answer was $correct_answer"
        score[i]=0
    fi
    
    # Calculate time taken
    end_time=$(date +%s.%N)
    howfast[i]=$(echo "$end_time - $start_time" | bc)
    
    echo  # Extra newline for spacing
done

# Calculate total score
for s in "${score[@]}"; do
    total_score=$((total_score + s))
done

# Calculate total time (rounded)
total_time=$(printf "%.0f" $(echo "${howfast[@]}" | tr ' ' '\n' | awk '{sum+=$1} END {print sum}'))

# Display results
echo "Total score: $total_score/10. You solved everything in $total_time seconds."