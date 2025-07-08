#................................
#....... PART 2 EXERCISE ....... 
#................................

# This exercise is competed in a regular R script, and can be attempted once you
#  understand the basics or already have some R experience 

# Load the dplyr library
library(dplyr)


#....... IRIS DATSET ....... 
#...........................

# We'll use a built-in dataset called iris 
myData = iris

# Take a look at the dataset (columns and what type of data they contain)

# --- Part 1 ---

# Create a new variable called `part1` which only contains the 
#  petal-related columns and the name of the species 
part1 <- myData |> select(Species, Petal.Length, Petal.Width)

# Filter the part1 dataframe further to only contain rows where the petal length
#  is 1.7 cm or more and the width is smaller than 2
part1 <- part1 |> filter(Petal.Length >= 1.7 & Petal.Width < 2)

# Summarise the data such that for each species so you will have the mean petal 
#  length and width
part1 <- part1 |> group_by(Species) |> 
  summarise(mLength = mean(Petal.Length), mWidth = mean(Petal.Width)) |> 
  ungroup()

# --- Part 2 ---

# Starting again from the original myData variable, create a new variable called 
#  part2 which does not contain the setosa species
part2 <- myData |> filter(Species != c("setosa"))

# Create a new column called longSepal that stores a boolean value (TRUE / FALSE) 
#  indicating whether for an observation the Sepal length is at least double 
#  that of the Sepal width 
part2 <- myData |> 
  mutate(longSepal = Sepal.Length >= 2 * Sepal.Width)

# Summarise the dataset by species and calculate the following:
# - Count in how many cases longSepal is TRUE (R treats TRUE as 1 and FALSE as 0)
# - Count the total number of observations per species: use the n() function
# - Calculate the min and max Sepal length across all observations in a species
part2 |>  group_by(Species) |> 
  summarise(longSepal = sum(longSepal), n = n(), 
            min = min(Sepal.Length), max = max(Sepal.Length)) |>
  ungroup()


#....... HUMANOIDs DATSET ....... 
#................................
# This dataset is adapted from
# https://www.kaggle.com/datasets/santiago123678/evolution-of-humans-datasets-for-clasification

# Download the adapted dataset from https://go.pjvan.camp/s2rdata1
#  and import the csv file as a data frame.

# Try to find out the following about homo sapiens (our species of human) based on the data
# - what are the major differences / similarities between the oldest and most recent species?
#    Note that the time is denoting how many millions of years ago the specimen lived
# - which other humanoid species are the most closely related to us?
#    Which features are most indicative of being more recent 
# - are species from the same region or habitat more likely to share similar characteristics?
# - Explore differences in diversity between, and age within species in the same location
