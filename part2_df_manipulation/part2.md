# From Spreadsheets to R
#### _... without going too far_

## _PART 2 - Data Frame Manipulations_

___

## Intro

In Part 1 we introduced data frames as a way to represent spreadsheets like Excel or Google Sheets in R. In this part, you'll learn how to load actual spreadsheet data into R and start exploring some useful data manipulations.

IMPORTANT NOTE: This tutorial will introduce you to the [Tidyverse Framework](https://www.tidyverse.org/) for data frame manipulation. This is an opinionated framework that uses different syntax from what we would consider _base R_, but it has been very successful and has been widely adopted by the R community. This means you will have to install the `tidyverse` library collection before you can start working with its functions.

```r
install.packages("tidyverse")
library(tidyverse)
```

Most functions for dataframe manipulation in the tidyverse libraries were written with the pipe operator `|>` in mind for better code readability. We will use this throughout this guide but you can always use the nested alternative as well (see Part 1).


## Tidy Data

Before we can load spreadsheets into R, we must make sure we have _tidy data_. We briefly introduces this in Part 1, but tidy data simply defines a data table with the following core properties:

- Each variable is a column; each column is a variable.
- Each observation is a row; each row is an observation.
- Each value is a cell; each cell is a single value.

If your data is not in a tidy format, we can still correct it, but it's better to think about this _before_ you start collecting or generating data.

**When importing data from spreadsheet, the following must be done before you should try to load it into R**

- There should only be a single table per tab
- The table must start at the top-left cell of the spreadsheet (i.e. no blank rows or columns before the table)
- The top row should contain the names of each column (i.e. the table header)
- No cells should be merged (perfect grid of rows and columns): remove merging if needed
- Note that all cell formatting will be ignored (e.g. colour, font, etc.)

## Loading a spreadsheet into R

You can load a spreadsheet as an R data frame using the `read_excel` function from the `readxl` library (is loaded when you load tidyverse).

```r
data <- read_excel(path = "myfile.xlsx")
```
The `path` argument in the [read_excel](https://www.rdocumentation.org/packages/readxl/versions/0.1.1/topics/read_excel) function is where you provide the file name of the Excel file you want to load. Make sure the file is in the same folder as your script (or change the path to the file)

_Note that the Tydiverse has its own variation on a dataframe called a tibble, but it is identical to the traditional dataframe when manipulated_

### Check the data

There are multiple ways you can quickly view and check your data

- Print the `data` variable to see a summary in the console or use a function like `glimpse()`
- If you are using R Studio, look for the variable in the [Environment pane](https://docs.posit.co/ide/user/ide/guide/ui/ui-panes.html). When you click it, it will open as a spreadsheet. You can also expand the variable by clicking the little icon in front of it to geta list of all columns names and their respective data types

## Selecting columns - `select()`

One of the simplest operations you can do is **selecting a set of columns** from a larger dataframe. This is useful when you want to perform sub-analyses that do not need all of the collected data. Do do this, we'll use the `select()` function from the `dplyr` library (loaded automatically when loading tidyverse library).

```r
data |> select(c(name, date, score))
```
_This will select the name, date and score columns from the data_

You can also invert the selection by putting a minus `-` before the column vector

```r
data |> select(-c(gender, race))
```
_This will select all columns apart from the gender and race ones_


The `select` function can take many different types of arguments to help selecting specific columns efficiently. See the [documentation](https://dplyr.tidyverse.org/reference/select.html) for more details

## Filtering rows - `filter()`

The `filter()` function, also part of the `dplyr` library, will **operate on the rows** of a data frame and can select specific ones based on any set of conditions that you specify using boolean logic (e.g. a comparison that will result in `TRUE` or `FALSE`).

```r
data |> filter(age < 50)
```
_This will filter out all rows where the value in the age column is less than 50_

### Boolean logic

Comparisons between simple values of the same data type can be made by using Boolean logical operators. They will output TRUE or FALSE.
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

You can combine multiple filtering conditions across multiple columns for more complex filtering.

```r
data |> filter(age < 50 & gender == "male")
data |> filter(age < 50 | gender == "male")
```
- _The first option will filter out all rows where the age is less than 50 **AND `&`** the gender is male._
- _The second option will filter out all rows where the age is less than 50 **OR `|`** the gender is male_

## Updating existing / Creating new columns - `mutate()`

The `mutate()` function will allow you to perform calculations using the values of one or more columns and storing the results in an existing or new column

```r
data |> mutate(score = score / 100)
data |> mutatae(finalScore = score / 100)
```
_Assuming we have the column score in our dataframe, fist option will update this column by dividing all the values by 100. The second option will do the same, but store the result in a new column called finalScore, keeping the original values in the score column unchanged _

You can work with values from differnt columns, as long as their data types are compatible.
```r
data |> mutate(result = score1 - score2)
```
_This will subtract the values of column score2 from the values of column score1 and store them in a new column result _

### Refresher on vector operations

Remember from Part 1 that columns in a dataframe are vectors, and thus any operation performed on a column will be a vector operation. This mean that if a vector.

You also learned to use functions on vectors, which again can be used in the exact same way on columns of a data frame. 

```r
data |> mutate(score = round(score, 2))
```
_This will round all the values in the score column to two decimal points _ 

However, if the function summarised the vector to a single value, this will be repeated for the whole column

```r
data |> mutate(score = mean(score))
```
_This will update ALL the values in the column to the mean of the whole column_

You can also use more complex vector operations
```r
data |> mutate(percent = score / max(score) * 100)
```
_This will divide all scores by the maximum score in the column then multiply the result by 100. The result of this is still a vector of the size of the column_
