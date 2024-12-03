import random
import time

# Generate random values
x = [random.randint(2, 9) for _ in range(10)]
y = [random.randint(2, 9) for _ in range(10)]

# Initialize lists
score = []
howfast = []

# Main game loop
for i in range(10):
    start_time = time.time()
    
    # Print multiplication problem
    print(f"How much is {x[i]} x {y[i]}? ", end='')
    
    # Read user input
    try:
        user_input = input()
        user_answer = int(user_input)
        
        # Check the answer
        if user_answer == x[i] * y[i]:
            print("Correct!\n")
            score.append(1)
        else:
            print(f"Wrong! Correct answer was {x[i] * y[i]}\n")
            score.append(0)
    
    except ValueError:
        print(f"Wrong! Correct answer was {x[i] * y[i]}\n")
        score.append(0)
    
    end_time = time.time()
    howfast.append(end_time - start_time)

# Calculate total time and score
total_time = round(sum(howfast))
total_score = sum(score)

# Display the results
print(f"Total score: {total_score}/10. You solved everything in {total_time} seconds.\n")