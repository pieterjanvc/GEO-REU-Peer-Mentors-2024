# From Spreadsheets to R

#### _... without going too far_

## _PART 2 - Data Frame Manipulations_

---

## Intro

In Part 1 we introduced data frames as a way to represent spreadsheets like
Excel or Google Sheets in R. In this part, you'll learn how to load actual
spreadsheet data into R and start exploring some useful data manipulations.

IMPORTANT NOTE: This tutorial will introduce you to the
[Tidyverse Framework](https://www.tidyverse.org/) for data frame manipulation.
This is an opinionated framework that uses different syntax from what we would
consider _base R_, but it has been very successful and has been widely adopted
by the R community. This means you will have to install the `tidyverse` library
collection before you can start working with its functions.

```r
install.packages("tidyverse") # Only run once to install
library(dplyr)
library(readxl)
```

Most functions for dataframe manipulation in the tidyverse libraries were
written with the pipe operator `|>` in mind for better code readability. We will
use this throughout this guide but you can always use the nested alternative as
well (see Part 1).

## Tidy Data

Before we can load spreadsheets into R, we must make sure the spreadsheet has a
_tidy data_ format. We briefly introduced this in Part 1, but for a table with
data to be in a tidy format is has to have the following properties:

- Each column is a _single_ variable
- Each observation is a _single_ row
- Each cell is a _single_ value.

If your data is not in a tidy format, we can still correct it in R, but it's
better to think about this _before_ you start collecting or generating data.

**When importing data from a spreadsheet into R, check the following**

- There should only be a single table per tab
- The table must start at the top-left cell of the spreadsheet (i.e. no blank
  rows or columns before the table)
- The top row should contain the names of each column (i.e. the table header)
- No cells should be merged (perfect grid of rows and columns). So remove
  merging if needed
- Note that all cell formatting will be ignored (e.g. colour, font, etc.)

## Loading a spreadsheet into R

You can load a spreadsheet as an R data frame using the `read_excel` function
from the `readxl` library you loaded.

```r
data <- read_excel(path = "myfile.xlsx")
```

The `path` argument in the
[read_excel](https://www.rdocumentation.org/packages/readxl/versions/0.1.1/topics/read_excel)
function is where you provide the file name of the Excel file you want to load.
Make sure the file is in the same folder as your script (or change the path to
the file)

_Note that the Tydiverse has its own variation on a dataframe called a tibble,
but it is identical to the traditional dataframe when manipulated_

### Check the data

There are multiple ways you can quickly view and check your data

- Print the `data` variable to see a summary in the console or use a function
  like `glimpse()`
- If you are using R Studio, look for the variable in the
  [Environment pane](https://docs.posit.co/ide/user/ide/guide/ui/ui-panes.html).
  When you click it, it will open as a spreadsheet. You can also expand the
  variable by clicking the little icon in front of it to get a list of all
  columns names and their respective data types

## Selecting columns - `select()`

One of the simplest operations you can do is **selecting a set of columns** from
a larger dataframe. This is useful when you want to perform an analysis on a
subset of the columns. Do do this, we'll use the `select()` function from the
`dplyr` library (loaded automatically when loading tidyverse library) and
provide a vector of the columns names we want to keep.

```r
data |> select(c("name", "date", "score"))
```

_This will select the name, date and score columns from the data_

Note that in `dplyr`, selecting columns using `select()` function does not
require you to use quoted strings, but you still can

```r
data |> select(c(name, date, score))
```

_This is identical to using quoted strings, but only works for dplyr functions_

You can also invert the selection by putting a minus `-` before the column
vector

```r
data |> select(-c(gender, race))
```

_This will select all columns apart from the gender and race ones_

If you know the order of the columns, you can also select by index instead of
names which saves you having to write out the names.

```r
data |> select(c(1,3,7))
```

The `select` function can take many different types of arguments to help
selecting specific columns efficiently. See the
[documentation](https://dplyr.tidyverse.org/reference/select.html) for more
details

## Filtering rows - `filter()`

The `filter()` function, also part of the `dplyr` library, will **operate on the
rows** of a data frame and can select specific ones based on any set of
conditions that you specify using boolean logic (e.g. a comparison that will
result in `TRUE` or `FALSE`).

```r
data |> filter(age < 50)
```

_This will filter out all rows where the value in the age column is less than
50_

### Boolean logic

Comparisons between simple values of the same data type can be made by using
Boolean logical operators. They will output TRUE or FALSE.

```r
5 < 6
8 < 6
```

_The first comparison will return `TRUE` the second one `FALSE`_

Commonly used boolean operators are:

- `>` greater than
- `>=` greater than or equal to
- `<` smaller than
- `<=` smaller than or equal to
- `==` equal
- `!=` not equal

You can combine multiple filtering conditions across multiple columns for more
complex filtering.

```r
data |> filter(age < 50 & gender == "male")
data |> filter(age < 50 | gender == "male")
```

- _The first option will filter out all rows where the age is less than 50 **AND
  `&`** the gender is male._
- _The second option will filter out all rows where the age is less than 50 **OR
  `|`** the gender is male_

For advanced `filter` functionality, please refer to the
[documentation](https://dplyr.tidyverse.org/reference/filter.html)

## Updating existing columns / Creating new columns - `mutate()`

The `mutate()` function will allow you to perform calculations using the values
of one or more columns and storing the results in an existing or new column

```r
data |> mutate(score = score / 100)
data |> mutatae(finalScore = score / 100)
```

_Assuming we have the column score in our dataframe, fist option will update
this column by dividing all the values by 100. The second option will do the
same, but store the result in a new column called finalScore, keeping the
original values in the score column unchanged_

You can work with values from different columns, as long as their data types are
compatible.

```r
data |> mutate(result = score1 - score2)
```

_This will subtract the values of column score2 from the values of column score1
and store them in a new column named result_

### Operations across a column

Remember from Part 1 that columns in a dataframe are vectors. This means that
**any operation performed on a column will be a vector operation**.

Imagine a data frame with a column called _score_ that stores the vector
`c(11.3, 16.658, 66.578, 22.01, 6.99)`

```r
data |> mutate(score = score + 10)
```

_This will add 10 to all values in the score column_

You also learned to use functions on vectors, which again can be used in the
exact same way on the columns of a data frame.

```r
data |> mutate(score = round(score, 1))
```

_This will round all the values in the score column to one decimal position_

However, if the function summarised the vector to a single value, this will be
repeated for the whole column

```r
data |> mutate(score = mean(score))
```

_This will update ALL the values in the column to the mean of the whole column_

You can also use more complex vector operations

```r
data |> mutate(percent = score / max(score) * 100)
```

_This will divide all scores by the maximum score in the column then multiply
the result by 100. The result of this is still a vector of the size of the
column_

For additional details on using the `mutate` functions, please refer to the
[documentation](https://dplyr.tidyverse.org/reference/mutate.html)

## Summarising data - `summarise()`

In many cases data analysis aims to summarise raw data to gain insights. We can
use the `summarise` or `summarize` functions on our dataframe to do this.

```r
data |> summarise(average = mean(score), stand_dev = sd(score))
```

_Here, we summarise the data by calculating the mean and standard deviation of
the score column and storing them as a new column_

Note that **summarising will compress the whole data frame into a single row**,
and thus the functions used within it must also produce a single value (e.g.
mean, and standard deviation). The result is a data frame with one row
containing all the summarised results defined in the function (all unused
columns are removed).

More info on the `summarise` function can be found in the
[documentation](https://dplyr.tidyverse.org/reference/summarise.html)

## Grouping data - `group_by()`

When we filter or summarise data, we often want to group the result by a
specific factor or category. The `group_by` function will do exactly that and
any operations on a data frame after it will be performed separately by group.

### Summarise by group

```r
data |> 
  group_by(team) |> 
  summarise(average = mean(score), stand_dev = sd(score)) |>
  ungroup()
```

_This code will summarise the results by team name, meaning that the **output
will be a dataframe with the number of rows equal to the number of unique
groups**, and the summary statistic will be calculated per group_

Use the `ungroup()` function to remove the grouping after having performed the
operations. If you fail to do this, all subsequent operations will be carried
out on the same groups instead of the whole dataframe.

### Filter by group

```r
data |> 
  group_by(team) |> 
  filter(score == max(score)) |>
  ungroup()
```

_This code will filter out (i.e. keep) the rows with the highest score by team.
The number of rows returned depends on the number of unique groups and the
filtering condition within each group_

To learn more about ways to group data and perform subsequent operations, refer
to the [dowumentation](https://dplyr.tidyverse.org/articles/grouping.html)
