# A line that starts with a hash tag is a comment

# --- Simple Data types
1

2.5

"hello world"

TRUE

# --- Grouped data
c(1,2,3)

c("item1", "item2")

list(1, "test", FALSE)

list(x = 1, y = "test", z = FALSE)

list(x = c(1,2,3), y = c("A", "B", "C"), z = c(TRUE, FALSE, FALSE))

data.frame(x = c(1,2,3), y = c("A", "B", "C"), z = c(TRUE, FALSE, FALSE))

# --- Variables
var1 = c(7.25,5.33,9.17)

var1

# --- Functions
sort(var1)

sort(var1, decreasing = TRUE)

# --- Pipe
var1 |> sort() |> round(1)

# --- Vector operations
var1 + 3

var1 + var1

var1 / min(var1)
