# From Spreadsheets to R

#### _... without going too far_

## _PART 3 - Plotting your data_

---

## Intro

We previously introduced data frames as a way to represent spreadsheets like
Excel or Google Sheets in R. In this part, you'll learn how to visualise the
data stored in data frames by generating plots.

IMPORTANT NOTE: This tutorial will introduce you to the
[Tidyverse Framework](https://www.tidyverse.org/) for plotting. ggplot is an
opinionated framework that uses different syntax from what we would consider
_base R_, but it has been very successful and has been widely adopted by the R
community. This means you will have to install the `tidyverse` library
collection before you can start working with its functions.

```r
install.packages("tidyverse") # Only run once to install
library(ggplot2)
```

## Grammar of Graphics

GGPLOT refers to the _Grammar of Graphics_, a structured way to defining a plot
and all its components in an intuitive and reproducible way both for humans and
computers.

_Similar to using `dplyr` functions to chain together a set of data frame
operations, we'll use a new set of functions from the `ggplot2` library to
define each component of a plot. Of note, ggplot2 predates the use of the pipe
in R, and it has its own built-in operator to **chain functions together with
the `+` symbol**._

## Mapping data to plot components

When creating a graph, we typically define a 2D grid (x and y axis) and plot
data points on it as a dot, line, bar, ... The values for each x and y
coordinate are typically sourced from columns of a data frame.

The base function from the `ggplot2` library is `ggplot()`. In it, we'll define
two important arguments: the data and the aesthetics.

```r
ggplot(data = myData, mapping = aes(x = time, y = value))
```

- The first **data** argument takes a dataframe that contains the data you want
  to visualise
- The second argument `mapping` will map specific columns to **aesthetics** of
  the plot. This is done by providing an aesthetics object `aes()`, which is a
  function where we define all relevant aspects of the graph and map them to a
  column in the data. Commonly used aesthetic parameters are
  - x : x-axis value of a data point
  - y : y-axis value of a data point
  - size : size of rendered data point
  - colour / color : colour of the rendered data point
  - group : group ID for data points
  - label : label name for the data point

_Note that when you run the ggplot function by itself, nothing will happen, we
need to define more details about the plot's geometry before we can render
anything_

## Rendering Geometry

Once we have our data and mapping (i.e. we know what is going where on the plot)
we need to define how we are going to visualise each data point. There are many
different ways in which the exact same data can be visualised, and it is up to
you do decide which works best. We'll be focussing on visualising data that
lives in an xy-coordinate system. Three common **render geometry functions**
are:

- `geom_point()` scatter (point) plot
- `geom_line()` line plot
- `geom_bar()` bar plot

Assuming we have defined a ggplot object with data and aesthetics, we can simply
pipe in a geometry function and render the results

```r
ggplot(data = myData, mapping = aes(x = time, y = value)) + 
  geom_point()
```

_Note again that we use the `+` symbol here to chain ggplot functions and
**not** the regular pipe symbol `|>`_

Changing this plot from a scatter to a line chart is as simple as changing the
geom function

```r
ggplot(data = myData, mapping = aes(x = time, y = value)) + 
  geom_line()
```

### Defining styles

Some aesthetics like size or colour can be defined either _globally_ (i.e. all
points are styled the same) or _data driven_ (i.e. each point is styled based on
other info in the data frame).

Styles that are **data driven** are defined **inside the aesthetics function**
`aes()`:

```r
ggplot(data = myData, mapping = aes(x = time, y = value, colour = pointCol)) + 
  geom_point()
```

_The point colour in this graph is based on the `pointCol` value in the data
frame (assuming this has a valid colour code)_

To set **global** styles, you specify the same parameter **outside of the
aesthetics function**

```r
ggplot(data = myData, mapping = aes(x = time, y = value)) + 
  geom_point(colour = "red")
```

_All points have the same red colour in this graph_

## Adjusting plot layout

The ggplot package has a large number of additional functions to customize
nearly every detail of a plot. We'll explore only a few common ones here:

### Title, x / y-axis labels - `labs()`

The labs functions takes the following relevant arguments

- x : label text for x-axis
- y : label text for y-axis
- title : title for the plot

_The default labels for the x and y axis are the columns names used in the
`aes()` function_

```r
ggplot(data = myData, mapping = aes(x = time, y = value)) + 
  geom_line() +
  labs(title = "Scatter plot of data", x = "Time in days", y = "Length in meters")
```

### Theme elements - `theme()`

The theme function has many arguments that allow you to change everything from
the background colour of the plot to the tick marks on each axis. We are not
exploring all of this here, but **refer to the
[documentation](https://ggplot2.tidyverse.org/reference/theme.html)** for more
info

However, there are a few **built-in themes** you can easily add for some basic
styling

- `theme_bw()` : simple black and white theme
- `theme_minimal()` : remove background colour and only show essential plot
  elements
- `theme_void()` : remove everything (e.g. labs, axes, background, legends, ...
  ) except the data points

```r
ggplot(data = myData, mapping = aes(x = time, y = value)) + 
  geom_line() +
  theme_bw()
```

## Saving the plot as an image - `ggsave`

You can use the `ggsave` function to save a ggplot object to an image file.

```r
ggsave(filename = "image.png", plot = myPlot, 
  width = 1800, height = 900, units = "px")
```

- `filename` should end with a valid image extension (e.g. .png or .jpeg)
- `plot` takes the variable containing the ggplot object
- `width` and `height` are the dimensions of the plot to save
- `units` specifies what the dimension values are (e.g. "px" = pixels)

## Additional resources

If you like to get an idea of popular kinds of plots you can create using R and
ggplot, you can visit the
**[R Graph Gallery](https://r-graph-gallery.com/barplot.html)**. This website
groups plots by type and shows examples of R code to recreate them.
