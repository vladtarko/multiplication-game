library(tidyverse) |> suppressPackageStartupMessages()

# Generate random values
x <- sample(2:9, size = 10, replace = TRUE)
y <- sample(2:9, size = 10, replace = TRUE)

# Initialize vectors
score <- numeric(10)
howfast <- numeric(10)

for (i in 1:10) {
  start_time <- Sys.time()
  
  z <- str_glue("read -p 'How much is {x[i]} x {y[i]}? ' input; echo $input") |> 
    system(intern = TRUE)

  # Check the answer
  if (as.numeric(z) == x[i] * y[i]) {
    cat("Correct!\n\n")
    score[i] <- 1
  } else {
    cat(str_glue("Wrong! Correct answer was {x[i] * y[i]}"), "\n\n")
    score[i] <- 0
  }
  
  end_time <- Sys.time()
  howfast[i] <- as.numeric(difftime(end_time, start_time, units = "secs"))
}

# Calculate total time and score
total_time <- round(sum(howfast))
total_score <- sum(score)

# Display the results
cat(str_glue("Total score: {total_score}/10. You solved everything in {total_time} seconds."), "\n\n")
