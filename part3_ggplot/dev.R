


library(tidyverse)
library(readxl)

data = read_xlsx("part2_df_manipulation/antiquities_act.xlsx")

data  = data %>% arrange(date) %>% 
  filter(action %in% c("Established", "Diminished", "Enlarged")) %>% 
  mutate(acres_affected = ifelse(action == "Diminished",
                                 -acres_affected, acres_affected)) %>% 
  group_by(current_name) %>% mutate(
    squareMiles = cumsum(acres_affected) / 640,
    total_acres_affected = cumsum(acres_affected)
    ) %>% 
  ungroup()

plotData = data %>% 
  filter(current_name %in% c("Bandelier National Monument", 
                             "Craters of the Moon National Monument",
                             "Pinnacles National Park") ) 

pres = plotData %>% group_by(pres_or_congress) %>% summarise(year = min(year)) %>% 
  ungroup() %>% arrange(desc(year))



plotData = plotData %>% 
  mutate(pres_or_congress = factor(pres_or_congress, levels = setNames(pres$pres_or_congress, pres$year)))

ggplot(plotData) +
  geom_line(aes(x = year, y = squareMiles, linetype = current_name), size = 0.9) +
  scale_linetype_manual(values = c("solid", "dashed", "dotted"))+
  geom_point(aes(x = year, y = squareMiles, color = pres_or_congress), size= 6) +
  theme_minimal() + 
  labs(
    title = "National parks and monuments under the antiquities act",
    x = "Year an action was taken", y = "Total size (square miles)",
    colour =  "Approved by", linetype = "Current name")


ggplot(plotData) +
  geom_bar(aes(x = current_name, y = acres_affected, fill = pres_or_congress), 
           color = "white", stat = "identity") +
  geom_text(aes(x = current_name, y = total_acres_affected - acres_affected / 2, 
                label = year)) +
  theme_minimal() + 
  labs(
    title = "National parks and monuments under the antiquities act",
    x = "Park or Monument", y = "Total size (square miles)",
    fill =  "Approved by")
