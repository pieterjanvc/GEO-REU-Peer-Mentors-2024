
# Load the libraries
library(readxl)
library(dplyr)

# install.packages("tidyverse") if needed

# Read in the data
data <- read_excel("part2_df_manipulation/antiquities_act.xlsx")

# Check data in Environment pain or with glimpse
colnames(data)
glimpse(data)

# ---- SELECT ----
myData <- data |> select(c("current_name", "states", "year"))
glimpse(myData)

myData <- data |> select(current_name, states, year)

# by index
myData <- data |> select(1,2,7)
glimpse(myData)

# inverted
myData <- data |> select(-c(1,2,7))
glimpse(myData)

# ---- FILTER ----

# Boolean logic
c(10,60,3,25) > 20
(1 >= 2) & ("A" == "A") 
(1 >= 2) | ("A" == "A") 

# Logic as filter
myData <- data |> filter(acres_affected < 100)
myData |> select(current_name, acres_affected)

myData <- data |> filter(acres_affected < 100 & states == "Florida")
myData |> select(acres_affected, states)

myData <- data |> filter(acres_affected < 100 | acres_affected > 1000000)
myData |> select(current_name, acres_affected)

# ---- MUTATE ----

myData = data |> mutate(years_protected = 2024 - year)
myData |> select(year, years_protected)

myData = data |> mutate(acres_affected = ceiling(acres_affected))
myData |> select(current_name, acres_affected)

# ---- SUMMARISE & GROUP BY ----

data |> 
  summarise(mean_acres = mean(acres_affected), sd_acres = sd(acres_affected))

data |> group_by(states) |> 
  summarise(mean_acres = mean(acres_affected), sd_acres = sd(acres_affected))


