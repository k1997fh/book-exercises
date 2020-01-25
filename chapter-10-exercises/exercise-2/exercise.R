# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"

employees <- paste("Employee", c(1:100))

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries <- runif(100, 40000, 50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
annual_adjust <- runif(100, -5000, 10000)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, salaries, annual_adjust, stringsAsFactors=FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries[["salaries_2018"]] <- salaries[["salaries"]] + salaries[["annual_adjust"]]

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries[["raised"]] <- salaries[["annual_adjust"]] > 0


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
salaries[salaries$employees == "Employee 57", "salaries_2018"]
# 47077.57

# How many employees got a raise?
raised_employee <- salaries[salaries$raised == TRUE, "employees"]
# 67

# What was the dollar value of the highest raise?
max_raise <- max(salaries[["annual_adjust"]])
# 9953.12043116428

# What was the "name" of the employee who received the highest raise?
max_raise_employee <- salaries[salaries$annual_adjust == max_raise, "employees"]
# Employee 50

# What was the largest decrease in salaries between the two years?
min_raise <- min(salaries[["annual_adjust"]])
# -4082.18318829313

# What was the name of the employee who recieved largest decrease in salary?
min_raise_employee <- salaries[salaries$annual_adjust == min_raise, "employees"]
# Employee 99

# What was the average salary change?
average_raise <- mean(salaries[["annual_adjust"]])
# 2317.54090751056

# For people who did not get a raise, how much money did they lose on average?
not_raised <- salaries[salaries$raised == FALSE, "annual_adjust"]
mean(not_raised)
# -2418.375

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
# Looks correct, considering the adjustment is from -5000 to 10000

# Write a .csv file of your salary data to your working directory
write(salaries, "E:\\CS\\INFO201\\book-exercises\\chapter-10-exercises\\exercise-2\\salaries.csv", row.names = FALSE)

