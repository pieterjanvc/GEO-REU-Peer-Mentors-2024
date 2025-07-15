library(tidyverse)
library(openxlsx)

# Read in original data
data = read_csv("data/actions_under_antiquities_act.csv")

# Clean up data
perfect = data %>%
  mutate(
    date = as.Date(data$date, format = "%m/%d/%y"),
    date = update(date, year = year),
    pres_or_congress = ifelse(
      pres_or_congress == "B.H. Obama",
      "B. H. Obama",
      pres_or_congress
    ),
    acres_affected = as.numeric(str_remove_all(acres_affected, ",")) %>%
      round(2)
  ) %>%
  filter(!is.na(acres_affected), !is.na(year)) %>%
  arrange(current_name, date)

# Write as new Excel document
write.xlsx(perfect, "data/actions_under_antiquities_act_cleaned.xlsx")

#### WATER QUALITY

# Read in original data
data <- read_excel("data/Water_Quality.xlsx")

# Cluster part of the dataset to cpture some variation
set.seed(3326)
clust <- kmeans(water |> select(Turbidity, Oxygen), 4)

# Create a new column testKit that will represent the use of different testing kits
data$area <- c("nature", "city", "industry", "suburbs")[clust$cluster]

# Check if there is a visual effect of different kits on Oxygen
plotData <- data |> group_by(area) |> summarise(z = mean(Turbidity))
ggplot(plotData, aes(x = area, y = z)) + geom_bar(stat = "identity")

# Check if there is a visual effect of different kits on pH
plotData <- data |> group_by(area) |> summarise(z = mean(pH))
ggplot(plotData, aes(x = area, y = z)) + geom_bar(stat = "identity")

write.xlsx(data, "part3_ggplot/waterQuality.xlsx")
