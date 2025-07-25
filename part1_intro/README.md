# Introduction to R data types, variables and functions

## Introduction

### Why should you learn to code if you work with spreadsheets ?

Many people who use computers for their job or studies work with some from of
spreadsheets like Excel or Google Sheets. Spreadsheets are a handy way to
collect and organise many types of data. Tools like Excel provide additional
clever functionality that can help you analyse the data and gain new insights.
However, when the dataset is complex, gets large, or the analysis becomes more
customized, manually curating and analyzing the data becomes difficult. This
often is the point where it is handed over to a data analyst, who will use
programming languages to automate the process and perform the seemingly hard
tasks.

Programming has come a long way and learning how to use it for specific tasks is
less daunting that it might seem. In this tutorial, we'll introduce you to one
of the programming languages that's popular in data science and analytics called
_R_. By following along in this interactive page, we'll introduce some very
basic data types in R and show how you can use them to construct something very
similar to an Excel spreadsheet. This will prepare you for the next step:
learning to analyze data from spreadsheet using simple R code.

Each of the sections will first introduce a new topic together with some code
examples.

Before you start, realize that learning how to code can often be frustrating or
overwhelming, but this is very normal. Just write down any questions you have
and bring them to the workshop where we can revisit them together.

---

_This tutorial was made to prepare students for an in-person workshop series on
coding with R for people with no prior experience but who perform data analysis
using Spreadsheets. It is not considered a comprehensive introduction to
programming, but rather focusses on aspects relevant to the workshop series. In
case of questions, please reach out to PJ Van Camp - pjvancamp@hms.harvard.edu_

## Data Types

There are many different types of data we put into spreadsheets, but in most
cases we can break them down into a few simple categories of values. Three of
the most common types of data entered into a spreadsheet are _numbers_, _text_
and _boolean_ (true / false) values.

### Numbers

In most programming languages like R, you can work with numbers the same way as
you would in a calculator. For example:

```r
1 + 1
```

_EXPLORE A BIT MORE: Try any of the other basic arithmetic operations using `-`,
`*` or `/` and try using decimal numbers as well like `2.5`_

_--- SIDE NOTE ---_

_In most programming languages whole numbers (integers), decimal numbers,
complex numbers etc. are technically all considered different data types, though
for this intro we won't worry about that._

### Text

The other common type of values are text (often called _strings_ when
programming). You can write strings by wrapping your text in quotes like this:

```r
"This is a string of text"
```

# Introduction to R data types, variables and functions

## Introduction

### Why should you learn to code if you work with spreadsheets ?

Many people who use computers for their job or studies work with some from of
spreadsheets like Excel or Google Sheets. Spreadsheets are a handy way to
collect and organise many types of data. Tools like Excel provide additional
clever functionality that can help you analyse the data and gain new insights.
However, when the dataset is complex, gets large, or the analysis becomes more
customized, manually curating and analyzing the data becomes difficult. This
often is the point where it is handed over to a data analyst, who will use
programming languages to automate the process and perform the seemingly hard
tasks.

Programming has come a long way and learning how to use it for specific tasks is
less daunting that it might seem. In this tutorial, we'll introduce you to one
of the programming languages that's popular in data science and analytics called
_R_. By following along in this interactive page, we'll introduce some very
basic data types in R and show how you can use them to construct something very
similar to an Excel spreadsheet. This will prepare you for the next step:
learning to analyze data from spreadsheet using simple R code.

Before you start, realize that learning how to code can often be frustrating or
overwhelming, but this is very normal. Just write down any questions you have
and bring them to the workshop where we can revisit them together.

---

_This tutorial was made to prepare students for an in-person workshop series on
coding with R for people with no prior experience but who perform data analysis
using Spreadsheets. It is not considered a comprehensive introduction to
programming, but rather focusses on aspects relevant to the workshop series. In
case of questions, please reach out to PJ Van Camp - pjvancamp@hms.harvard.edu_

## Data Types

There are many different types of data we put into spreadsheets, but in most
cases we can break them down into a few simple categories of values. Three of
the most common types of data entered into a spreadsheet are _numbers_, _text_
and _boolean_ (true / false) values.

### Numbers

In most programming languages like R, you can work with numbers the same way as
you would in a calculator. For example:

```r
1 + 1
```

_EXPLORE A BIT MORE: Try any of the other basic arithmetic operations using `-`,
`*` or `/` and try using decimal numbers as well like `2.5`_

_--- SIDE NOTE ---_

_In most programming languages whole numbers (integers), decimal numbers,
complex numbers etc. are technically all considered different data types, though
for this intro we won't worry about that._

### Text

The other common type of values are text (often called _strings_ when
programming). You can write strings by wrapping your text in quotes like this:

```r
"This is a string of text"
```

_EXPLORE A BIT MORE: Try changing the text. Also note that using single quotes
`'` also work when wrapping text_

### Boolean

A Boolean value is a binary value that simply means _true_ or _false_. In R
these can be written as `TRUE` / `FALSE` or `T` / `F`

```r
TRUE
```

_Note that this is case sensitive and you must use all capital letters_

### Grouping data

Now we have introduced a few basic data types, we can take a look on how we can
group them into more complex structures. We'll start by taking a look at vectors
and lists.

### Vectors

We can combine multiple values of the _same type_ by putting them in a vector
`c()`

```r
c(1,2,3,4,5)
```

_EXPLORE A BIT MORE: Replace the vector with one containing 3 strings: cat, dog,
horse_

### Lists

We can group multiple values of _different types_ by creating a list `list()`

```r
list(TRUE, "test", c(1,2,3))
```

_This list has 3 entries: a boolean, a string and a vector (which in turn
contains 3 numbers)_

Lists also allow you to give a unique name to each of its entries like so:

```r
list(item1 = TRUE, item2 = "test", item3 = c(1,2,3))
```

### Note on _lines of code_

You can see that the code boxes have line numbers. This is because when the code
is run, it's done so line by line (each line containing a new instruction).
However, there are ways of splitting a long line of code across multiple lines
for better readability without _breaking_ the code.

Examples of valid ways to split a line are _after_ an opening bracket `(` a
comma `,` or a curly brace `{` and _before_ a closing bracket `)` or curly brace
`}`. When R executes the code, it will ignore these line breaks and interpret
them as if they were on as single line. This means we can rewrite ...

```r
list(item1 = TRUE, item2 = "test", item3 = c(1,2,3))
```

... like so ...

```r
list(
  item1 = TRUE, 
  item2 = "test", 
  item3 = c(1,2,3)
)
```

... and it will still be valid and interpreted as a single line.

### Try it yourself

Create the following named list:

- The first entry contains a vector of the numbers 1, 2 and 3 and is named
  _first_
- The second entry contains a vector with the letters a, b and c (lower-case)
  and is named _second_

```r
list()
```

## Data Frames

### Building on what we know ...

In the previous topic you learned about basic R data types. Let's now use them
to recreate a spreadsheet. Start by taking a look at this spreadsheet table
below

```r
data.frame(name = c("Mohamet", "Lin Yi", "Nina"), age = c(21,19,24),
           student = c(TRUE, TRUE, FALSE)) %>% kable()
```

This simple spreadsheet records student info and is a table with the following
properties:

- Each row is an entry in the table (i.e. info about a particular student)
- Each column records a different observation
- Every column has a header that describes what is being recorded

Note that the values in every column are of the same data type. This means we
can represent them as a vector. For example, the first column would be
`c("Mohamet", "Lin Yi", "Nina")`. If we do this for all three columns and
organise them as a list in R, we can recreate the whole table like this:

```r
list(
  name = c("Mohamet", "Lin Yi", "Nina"), 
  age = c(42,33,19),
  student = c(TRUE, TRUE, FALSE)
)
```

We just converted our spreadsheet to a data structure in R! Note that the way it
is written in R looks like the table was rotated with the columns now horizontal
an the rows vertical.

### Introducing the R Data Frame

Although the list above is a valid representation of a table, R has another,
special, built-in data structure that optimises working with this type of data
called a _data frame_. It is constructed very much like we did with the list but
is handled and displayed differently:

```r
data.frame(
  name = c("Mohamet", "Lin Yi", "Nina"), 
  age = c(42,33,19),
  student = c(TRUE, TRUE, FALSE)
)
```

A data frame imposes more restrictions on how the data can be organised as it
has to conform to the rules of a well-organised spreadsheet table. These rules
are:

- Every column needs a unique name (avoid using spaces)
- Every column can only hold a single data type (i.e. needs to be represented as
  a vector)
- The length of each column has to be the same

_There are more rules that you should follow to create a tidy table, but they
will not be discussed here_

### Try it yourself

Fix the following code so it becomes a _valid_ data frame with 3 rows, and the
columns: animal, mammal and legs.

```r
data.frame(
  animal = c("dog", "beetle", "spider"), 
  mammal = c(TRUE, TRUE),
  c(4, 6, 8)
)
```

_You will see errors appear as long as it's not correct, but keep trying!_

## Variables

Now we know how to create different types of data in R, let's see how we can
store and access them.

### Storing data into a variable

We define (assign) a variable by picking a `name` followed by the assignment
`<-` operator (`<` followed by `-`) and then the `value` (or calculation that
will generate one).

Valid variable names:

- must start with a letter
- can only have alphanumeric characters (A-Z, a-z, 0-9), `_` or `.`
- do NOT have spaces

```r
x <- FALSE
y2 <- data.frame(x = c(1,2,3), y = c("A", "B", "C"))
other_var <- (6 + 4) / 2

x
```

_EXPLORE A BIT MORE: You can print the content of a variable by simply writing
its name on a separate line (e.g. `x` on line 5 will print FALSE). Try and
replace `x` with any of the other variable names listed to print their content
when you run the code._

### Updating a variable

You can update a variable by using the same name, but assigning a different
value

```r
x <- 1
x
x <- 2 + 3
x
```

We can also use the values stored in variables to perform calculations

```r
x <- 5
y <- x * 2
y
```

We can even update a variable by using it's own value then reassigning it

```r
x <- 10 - 4
x <- x / 2
x
```

### Try it yourself

On line 4 create a new variable `prod` that stores the product of x, y and z On
line 5, print the result

```r
x <- 5
y <- 7
z <- 11
```

## Functions

### Intro

The power of programming lies in the ability to execute a set of instructions
automatically and being able to reuse code written by others or yourself. This a
accomplished using _functions_. Just as in mathematics, a function contains a
set of instructions, with variables or parameters that serve as placeholders.

Let say we have a vector x ...

```r
x = c(1, 15, 22, 10)
```

... and we want to calculate the mean value. R has a built-in function called
`mean()` which takes in a vector and returns the mean:

```r
mean(x)
```

```r
values <- c(1, 15, 22, 10)
result <- mean(values)
result
```

_EXPLORE A BIT MORE: Try to replace the mean function with some other basic
functions you can execute on vectors of numbers like `min`, `max` or `sum`_

### Arguments

Some functions have multiple parameters / arguments that you have to specify.

For example, the `round` function has two parameters: `x`, which is the value we
like to round, and `digits`, the number of decimal points we want to round to.
If we want to round a number to 3 decimal points we specify them inside the
function ...

```r
value <- 17/13
value
value_rounded <- round(x = value, digits = 3)
value_rounded
```

... we set `x` to the value and `digits` to 3.

There are multiple ways to find out which arguments a function takes

#### Option 1: look at the function code

To run the function _without_ the brackets `()` to print its code and look at
the arguments listed at the top

```r
round
```

_Note that the second argument here already has a default value assigned (see
notes below for more details)_

#### Option 2: load the function documentation

The people created the functions also wrote documentation on how to use them.
You can read this documentation by running the function _without_ the brackets
and putting a question mark in front of it. This will open up the function
documentation where you can read more about specific function arguments.

```r
?round
```

_NOTE: In this tutorial, the documentation is just printed in plain text and
might contains strange characters or formatting. When you run this in a real
code-editor, it is often rendered much nicer or even interactive_

#### Option 3: Code editor tooltips

Many code editors like [R Studio](https://posit.co/download/rstudio-desktop/) or
[Positron](https://positron.posit.co/) will automatically show function
arguments whilst writing code or when you hover over a function name in your
code. Even here you will see suggestions pop-up when you start typing the
brackets of a known function

```r
round
```

#### Notes about function arguments

If you don't specify the argument names explicitly, the first value will become
the first listed argument, the second the next, etc.

```r
round(1.333, 1)
```

_This implicit argument assignment will be translated to round(x = 1.333, digits
= 1) when the code is run_

Functions can come with default values for some of its arguments, which you
don't have to set if you are OK with the value. In other words, functions have
required arguments (i.e. no default and you have to provide a value) and
optional arguments (you can choose to override the default if you want). Look at
the function documentation to see which ones are required.

```r
round(1.333)
```

_By default `digits = 0`_

You can combine implicit (unnamed) and explicit (named) arguments, but the
implicit ones always have to come first and all required arguments need to have
a value. Let's take the
[format](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/format)
function as an example

```r
format(15658475, big.mark = ",")
```

_In this example, big.mark is the 9th argument, but since all apart from the
first argument have default values, we can use named arguments to only override
those we need to change_

### Try it yourself

1. You are given a variable _values_ that contains a vector of numbers.
2. On line 2 use the function `sort` to sort the values in the vector and save
   the result to a new variable called _values_sorted_
3. Now make sure that the sorting happens in _decreasing_ order (i.e. highest to
   lowest). You will need to specify an argument in the sort function to make
   this happen (look at the documentation of the sort function)
4. Print the result of _values_sorted_ on line 3

```r
values <- c(11.2, 16, 0.6, 8.89)
```

### Combining functions

Functions can use other functions as input to create more complex behaviour.
There are two ways of doing this:

#### Nested functions

Just as in mathematics, the inner most calculations of nested functions are
performed before the outer ones use the results.

```r
floor(sqrt(2))
```

_The square root function is run first before the value is used in the flooring
function_

#### Piping (chaining) functions

Highly nested functions can become difficult to read, so it it also possible to
write your code differently by using the result from one function as the input
of the next function using the piping operator `|>` (`|` followed by `>`).

```r
sqrt(2) |> floor()
```

- The function that needs to be executed first comes first in the chain
- The result from the previous function will occupy the _first_ argument slot of
  the next function.
- You can add (optional) named arguments to any function in the chain

More complex example:

```r
sqrt(2) |> exp() |> round(digits = 3)
```

_Take the square root of 2, exponentiate it (raise e, Euler's number to this
power) and then round the result to 3 digits_

_This is more readable than the nested version `round(exp(sqrt(2)),digits = 3)`_

---

Note on the piping operator

The built-in piping operator `|>` was only introduced in R version 4.1.0
in 2021. It was already possible long before that to use piping but this
required an additional package to be installed. Hence, you will still see code
using an alternative pipe which looks like `%>%`. Both are identical in
functionality.

### Try it yourself

- On line 2, write a _nested_ set of functions what will `sum` all the values in
  _vec_ and then `floor` the result (i.e. round down to the nearest integer)
- On line 3, write the same set of functions but now using the piping operator.

```r
vec <- c(65.001,58,412.4,36,87.6666,4,11,0.69)
```

## Vector operations

Remember that a data frame in essence is a list of column vectors. Before we
learn to work with this, it's important to know how R makes it very easy to
perform operations across vectors. We'll just explore the basics you need here.

### Simple vector math

When you perform basic arithmetic operations on a vector, they will be carried
out for every element in that vector and return a new vector with the results.

```r
vec <- c(2,4,6,8,10)
vec / 2
```

_EXPLORE A BIT MORE: You can try out other basic operations like `+`, `-` or
`*`_

### Operations with multiple vecors of the same length

When you perform basic arithmetic operations using two compatible vectors of the
same length they will be carried out by using the first element of each vector
for the first calculation, the the second for the next one and so on, returning
again a vector with all results.

```r
vec <- c(1,2,3,4,5)
vec + vec
```

_EXPLORE A BIT MORE: You can try out other basic operations like `+`, `-` or
`*`_

### Functions across vectors

Finally, you can use functions across a vector. The result depends on what the
effect of the function is. For example:

```r
vec <- c(1.554,6.23,2.201,0.01366)
sum(vec)
```

_As seen before, this will sum all elements in the vector and return a single
value_

```r
vec <- c(1.554,6.23,2.201,0.1366)
round(vec, digits = 1)
```

_On the other hand, if a function is made to be run on a single value, it will
just be repeated for every value in the vector and return the result vector_

### Try it yourself

When _centering_ a vector of numbers, you ensure that the mean value is zero
without changing the original distribution. This is accomplished subtracting the
current mean from each individual value. For example: the list 2, 4, 9 has a
mean value of 5. If we subtract this from each value we get -3, -1 , 4 which has
a mean of 0.

1. You are given a variable _vec_ that contains a set of numbers
2. Calculate the mean value using the `mean` function
3. Use vector operations to subtract the mean from each entry in the vector

```r
vec <- c(11,6,3,8,9)
```

_Note, you can accomplish step 2 and 3 in a single line, or create an
intermediate variable. You can try both and get the same result_

## Wrap-up

Congratulations, you now know all the basics to be ready to start working with
data frames in R! You can revisit this introduction at any time, but don't worry
if some things are still unclear, learning to code takes time and frustration is
definitely part of the experience, but you'll have more opportunity to practice
soon!

_EXPLORE A BIT MORE: Try changing the text. Also note that using single quotes
`'` also work when wrapping text_

### Boolean

A Boolean value is a binary value that simply means _true_ or _false_. In R
these can be written as `TRUE` / `FALSE` or `T` / `F`

```r
TRUE
```

_Note that this is case sensitive and you must use all capital letters_

### Grouping data

Now we have introduced a few basic data types, we can take a look on how we can
group them into more complex structures. We'll start by taking a look at vectors
and lists.

### Vectors

We can combine multiple values of the _same type_ by putting them in a vector
`c()`

```r
c(1,2,3,4,5)
```

_EXPLORE A BIT MORE: Replace the vector with one containing 3 strings: cat, dog,
horse_

### Lists

We can group multiple values of _different types_ by creating a list `list()`

```r
list(TRUE, "test", c(1,2,3))
```

_This list has 3 entries: a boolean, a string and a vector (which in turn
contains 3 numbers)_

Lists also allow you to give a unique name to each of its entries like so:

```r
list(item1 = TRUE, item2 = "test", item3 = c(1,2,3))
```

### Note on _lines of code_

You can see that the code boxes have line numbers. This is because when the code
is run, it's done so line by line (each line containing a new instruction).
However, there are ways of splitting a long line of code across multiple lines
for better readability without _breaking_ the code.

Examples of valid ways to split a line are _after_ an opening bracket `(` a
comma `,` or a curly brace `{` and _before_ a closing bracket `)` or curly brace
`}`. When R executes the code, it will ignore these line breaks and interpret
them as if they were on as single line. This means we can rewrite ...

```r
list(item1 = TRUE, item2 = "test", item3 = c(1,2,3))
```

... like so ...

```r
list(
  item1 = TRUE, 
  item2 = "test", 
  item3 = c(1,2,3)
)
```

... and it will still be valid and interpreted as a single line.

### Try it yourself

Create the following named list:

- The first entry contains a vector of the numbers 1, 2 and 3 and is named
  _first_
- The second entry contains a vector with the letters a, b and c (lower-case)
  and is named _second_

```r
list()
```

## Data Frames

### Building on what we know ...

In the previous topic you learned about basic R data types. Let's now use them
to recreate a spreadsheet. Start by taking a look at this spreadsheet table
below

```r
data.frame(name = c("Mohamet", "Lin Yi", "Nina"), age = c(21,19,24),
           student = c(TRUE, TRUE, FALSE)) %>% kable()
```

This simple spreadsheet records student info and is a table with the following
properties:

- Each row is an entry in the table (i.e. info about a particular student)
- Each column records a different observation
- Every column has a header that describes what is being recorded

Note that the values in every column are of the same data type. This means we
can represent them as a vector. For example, the first column would be
`c("Mohamet", "Lin Yi", "Nina")`. If we do this for all three columns and
organise them as a list in R, we can recreate the whole table like this:

```r
list(
  name = c("Mohamet", "Lin Yi", "Nina"), 
  age = c(42,33,19),
  student = c(TRUE, TRUE, FALSE)
)
```

We just converted our spreadsheet to a data structure in R! Note that the way it
is written in R looks like the table was rotated with the columns now horizontal
an the rows vertical.

### Introducing the R Data Frame

Although the list above is a valid representation of a table, R has another,
special, built-in data structure that optimises working with this type of data
called a _data frame_. It is constructed very much like we did with the list but
is handled and displayed differently:

```r
data.frame(
  name = c("Mohamet", "Lin Yi", "Nina"), 
  age = c(42,33,19),
  student = c(TRUE, TRUE, FALSE)
)
```

A data frame imposes more restrictions on how the data can be organised as it
has to conform to the rules of a well-organised spreadsheet table. These rules
are:

- Every column needs a unique name (avoid using spaces)
- Every column can only hold a single data type (i.e. needs to be represented as
  a vector)
- The length of each column has to be the same

_There are more rules that you should follow to create a tidy table, but they
will not be discussed here_

### Try it yourself

Fix the following code so it becomes a _valid_ data frame with 3 rows, and the
columns: animal, mammal and legs.

```r
data.frame(
  animal = c("dog", "beetle", "spider"), 
  mammal = c(TRUE, TRUE),
  c(4, 6, 8)
)
```

_You will see errors appear as long as it's not correct, but keep trying!_

## Variables

Now we know how to create different types of data in R, let's see how we can
store and access them.

### Storing data into a variable

We define (assign) a variable by picking a `name` followed by the assignment
`<-` operator (`<` followed by `-`) and then the `value` (or calculation that
will generate one).

Valid variable names:

- must start with a letter
- can only have alphanumeric characters (A-Z, a-z, 0-9), `_` or `.`
- do NOT have spaces

```r
x <- FALSE
y2 <- data.frame(x = c(1,2,3), y = c("A", "B", "C"))
other_var <- (6 + 4) / 2

x
```

_EXPLORE A BIT MORE: You can print the content of a variable by simply writing
its name on a separate line (e.g. `x` on line 5 will print FALSE). Try and
replace `x` with any of the other variable names listed to print their content
when you run the code._

### Updating a variable

You can update a variable by using the same name, but assigning a different
value

```r
x <- 1
x
x <- 2 + 3
x
```

We can also use the values stored in variables to perform calculations

```r
x <- 5
y <- x * 2
y
```

We can even update a variable by using it's own value then reassigning it

```r
x <- 10 - 4
x <- x / 2
x
```

### Try it yourself

On line 4 create a new variable `prod` that stores the product of x, y and z On
line 5, print the result

```r
x <- 5
y <- 7
z <- 11
```

## Functions

### Intro

The power of programming lies in the ability to execute a set of instructions
automatically and being able to reuse code written by others or yourself. This a
accomplished using _functions_. Just as in mathematics, a function contains a
set of instructions, with variables or parameters that serve as placeholders.

Let say we have a vector x ...

```r
x = c(1, 15, 22, 10)
```

... and we want to calculate the mean value. R has a built-in function called
`mean()` which takes in a vector and returns the mean:

```r
mean(x)
```

_EXPLORE A BIT MORE: Try to replace the mean function with some other basic
functions you can execute on vectors of numbers like `min`, `max` or `sum`_

### Arguments

Some functions have multiple parameters / arguments that you have to specify.

For example, the `round` function has two parameters: `x`, which is the value we
like to round, and `digits`, the number of decimal points we want to round to.
If we want to round a number to 3 decimal points we specify them inside the
function ...

```r
value <- 17/13
value
value_rounded <- round(x = value, digits = 3)
value_rounded
```

... we set `x` to the value and `digits` to 3.

There are multiple ways to find out which arguments a function takes

#### Option 1: look at the function code

To run the function _without_ the brackets `()` to print its code and look at
the arguments listed at the top

```r
round
```

_Note that the second argument here already has a default value assigned (see
notes below for more details)_

#### Option 2: load the function documentation

The people created the functions also wrote documentation on how to use them.
You can read this documentation by running the function _without_ the brackets
and putting a question mark in front of it. This will open up the function
documentation where you can read more about specific function arguments.

```r
?round
```

_NOTE: In this tutorial, the documentation is just printed in plain text and
might contains strange characters or formatting. When you run this in a real
code-editor, it is often rendered much nicer or even interactive_

#### Option 3: Code editor tooltips

Many code editors like [R Studio](https://posit.co/download/rstudio-desktop/) or
[Positron](https://positron.posit.co/) will automatically show function
arguments whilst writing code or when you hover over a function name in your
code. Even here you will see suggestions pop-up when you start typing the
brackets of a known function

```r
round
```

#### Notes about function arguments

If you don't specify the argument names explicitly, the first value will become
the first listed argument, the second the next, etc.

```r
round(1.333, 1)
```

_This implicit argument assignment will be translated to round(x = 1.333, digits
= 1) when the code is run_

Functions can come with default values for some of its arguments, which you
don't have to set if you are OK with the value. In other words, functions have
required arguments (i.e. no default and you have to provide a value) and
optional arguments (you can choose to override the default if you want). Look at
the function documentation to see which ones are required.

```r
round(1.333)
```

_By default `digits = 0`_

You can combine implicit (unnamed) and explicit (named) arguments, but the
implicit ones always have to come first and all required arguments need to have
a value. Let's take the
[format](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/format)
function as an example

```r
format(15658475, big.mark = ",")
```

_In this example, big.mark is the 9th argument, but since all apart from the
first argument have default values, we can use named arguments to only override
those we need to change_

### Try it yourself

1. You are given a variable _values_ that contains a vector of numbers.
2. On line 2 use the function `sort` to sort the values in the vector and save
   the result to a new variable called _values_sorted_
3. Now make sure that the sorting happens in _decreasing_ order (i.e. highest to
   lowest). You will need to specify an argument in the sort function to make
   this happen (look at the documentation of the sort function)
4. Print the result of _values_sorted_ on line 3

```r
values <- c(11.2, 16, 0.6, 8.89)
```

### Combining functions

Functions can use other functions as input to create more complex behaviour.
There are two ways of doing this:

#### Nested functions

Just as in mathematics, the inner most calculations of nested functions are
performed before the outer ones use the results.

```r
floor(sqrt(2))
```

_The square root function is run first before the value is used in the flooring
function_

#### Piping (chaining) functions

Highly nested functions can become difficult to read, so it it also possible to
write your code differently by using the result from one function as the input
of the next function using the piping operator `|>` (`|` followed by `>`).

```r
sqrt(2) |> floor()
```

- The function that needs to be executed first comes first in the chain
- The result from the previous function will occupy the _first_ argument slot of
  the next function.
- You can add (optional) named arguments to any function in the chain

More complex example:

```r
sqrt(2) |> exp() |> round(digits = 3)
```

_Take the square root of 2, exponentiate it (raise e, Euler's number to this
power) and then round the result to 3 digits_

_This is more readable than the nested version `round(exp(sqrt(2)),digits = 3)`_

---

Note on the piping operator

The built-in piping operator `|>` was only introduced in R version 4.1.0
in 2021. It was already possible long before that to use piping but this
required an additional package to be installed. Hence, you will still see code
using an alternative pipe which looks like `%>%`. Both are identical in
functionality.

### Try it yourself

- On line 2, write a _nested_ set of functions what will `sum` all the values in
  _vec_ and then `floor` the result (i.e. round down to the nearest integer)
- On line 3, write the same set of functions but now using the piping operator.

```r
vec <- c(65.001,58,412.4,36,87.6666,4,11,0.69)
```

## Vector operations

Remember that a data frame in essence is a list of column vectors. Before we
learn to work with this, it's important to know how R makes it very easy to
perform operations across vectors. We'll just explore the basics you need here.

### Simple vector math

When you perform basic arithmetic operations on a vector, they will be carried
out for every element in that vector and return a new vector with the results.

```r
vec <- c(2,4,6,8,10)
vec / 2
```

_EXPLORE A BIT MORE: You can try out other basic operations like `+`, `-` or
`*`_

### Operations with multiple vecors of the same length

When you perform basic arithmetic operations using two compatible vectors of the
same length they will be carried out by using the first element of each vector
for the first calculation, the the second for the next one and so on, returning
again a vector with all results.

```r
vec <- c(1,2,3,4,5)
vec + vec
```

_EXPLORE A BIT MORE: You can try out other basic operations like `+`, `-` or
`*`_

### Functions across vectors

Finally, you can use functions across a vector. The result depends on what the
effect of the function is. For example:

```r
vec <- c(1.554,6.23,2.201,0.01366)
sum(vec)
```

_As seen before, this will sum all elements in the vector and return a single
value_

```r
vec <- c(1.554,6.23,2.201,0.1366)
round(vec, digits = 1)
```

_On the other hand, if a function is made to be run on a single value, it will
just be repeated for every value in the vector and return the result vector_

### Try it yourself

When _centering_ a vector of numbers, you ensure that the mean value is zero
without changing the original distribution. This is accomplished subtracting the
current mean from each individual value. For example: the list 2, 4, 9 has a
mean value of 5. If we subtract this from each value we get -3, -1 , 4 which has
a mean of 0.

1. You are given a variable _vec_ that contains a set of numbers
2. Calculate the mean value using the `mean` function
3. Use vector operations to subtract the mean from each entry in the vector

```r
vec <- c(11,6,3,8,9)
```

_Note, you can accomplish step 2 and 3 in a single line, or create an
intermediate variable. You can try both and get the same result_

## Wrap-up

Congratulations, you now know all the basics to be ready to start working with
data frames in R! You can revisit this introduction at any time, but don't worry
if some things are still unclear, learning to code takes time and frustration is
definitely part of the experience, but you'll have more opportunity to practice
soon!
