library(tidyverse)
library(openxlsx)

# Read in original data
data = read_csv("data/actions_under_antiquities_act.csv")

# Clean up data
perfect = data %>%  mutate(
  date = as.Date(data$date, format = "%m/%d/%y"),
  date = update(date, year = year),
  pres_or_congress = ifelse(pres_or_congress == "B.H. Obama", "B. H. Obama",
                            pres_or_congress),
  acres_affected = as.numeric(str_remove_all(acres_affected, ",")) %>% round(2)
) %>% 
  filter(!is.na(acres_affected), !is.na(year)) %>% 
  arrange(current_name, date)

# Write as new Excel document
write.xlsx(perfect, "data/actions_under_antiquities_act_cleaned.xlsx")
