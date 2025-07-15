# Libraries needed
library(ggplot2)
library(dplyr)
library(readxl)
library(stringr)

# Read + explore the data
water <- read_xlsx("part3_ggplot/Water_Quality.xlsx")

# --- Data mapping
waterPlot <- ggplot(water, aes(x = pH, y = Oxygen))

waterPlot + geom_point()
waterPlot + geom_line()


# --- Plot attributes

# Static
ggplot(water, aes(x = pH, y = Oxygen)) +
  geom_point(size = 3)

# Data driven
ggplot(water, aes(x = pH, y = Oxygen, size = Temp)) +
  geom_point()


# --- Plot theme

# labs
ggplot(water, aes(x = pH, y = Oxygen, size = Temp)) +
  geom_point() +
  labs(
    x = "Water pH",
    y = "Dissolved Oxygen (mg/L)",
    title = "Effect of water pH on oxygenation"
  )

# themes
ggplot(water, aes(x = pH, y = Oxygen, size = Temp)) +
  geom_point() +
  labs(
    x = "Water pH",
    y = "Dissolved Oxygen (mg/L)",
    title = "Effect of water pH on oxygenation"
  ) +
  theme_bw()


# --- Bar charts

# Summarise data first
sumData <- water |>
  group_by(pH) |>
  summarise(Oxygen = mean(Oxygen)) |>
  ungroup()

# Plot the bars
ggplot(sumData, aes(x = pH, y = Oxygen)) +
  geom_bar(stat = "identity")

# try it yourself ...

# --- Saving as image

#(take last water plot and save it to waterPlot)

ggsave(
  filename = "oxygenation.png",
  plot = waterPlot,
  width = 1800,
  height = 900,
  units = "px"
)

# -- R graph gallery

# visit website

### --- EXTRA --- ###
flowers <- iris

# --- Specify colours

# Discrete
ggplot(
  flowers,
  aes(x = Petal.Length, y = Petal.Width, colour = Species)
) +
  geom_point() +
  theme_minimal() +
  # Use a discrete set of colours
  scale_colour_discrete(
    name = "Iris species",
    type = c(setosa = "orange", versicolor = "#72BD13", virginica = "purple")
  )

# Continuous
ggplot(flowers, aes(x = Petal.Length, y = Petal.Width, colour = Sepal.Length)) +
  geom_point() +
  theme_minimal() +
  # Use a colour gradient
  scale_colour_gradientn(
    name = "Sepal Length",
    colours = c("#132B43", "#72BD13", "#ED553B")
  )

# --- Text labels
ggplot(flowers, aes(x = Petal.Length, y = Petal.Width, label = Species)) +
  theme_minimal() +
  geom_text(check_overlap = TRUE)

# --- trend line
ggplot(flowers, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point() +
  theme_minimal() +
  geom_smooth(method = "lm", se = FALSE, colour = "#72BD13")
