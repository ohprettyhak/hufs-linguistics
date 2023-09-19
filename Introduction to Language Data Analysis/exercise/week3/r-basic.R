# operator
print(5 / 2)
print(5 %% 2)
print(5 %/% 2)
print(5**2)
print(5^2)
print(2 + 8 * 3)
print(4 * (32 - 16))
print((2 + 3)**(5 - 2))

time <- 2237
print(paste(time %/% 60, "hours", time %% 60, "minutes"))

print(2 + 5 > 6)  # TRUE
print(10 >= 5**(5 - 2))  # FALSE
print(4 * 2 != 3**5)  # TRUE
print(TRUE & FALSE)  # FALSE
print((23 > 21) | (52 < 20))  # TRUE
print(4 > 3 & 4 == 4)  # TRUE

# variables
# error cases
# 1name<- 0
# .123real < - 0
# if <- 0
# &nd <- 0

a = 1
A = 1
B = 1 + 3

# functions
# built-in

vec <- c("1", "3", "4", "5", "6", "hello")
print(vec)

vec2 <- c("-1", "8", "-3", "6", "0")
print(vec2)
print(sort(vec2))

vec2 <- c(-1, 8, -3, 6, 0)
print(vec2)
print(sort(vec2))
print(sort(vec2, decreasing = TRUE))

myfunc <- function(x) {
  print(paste("The circumference is:", pi * 2 * x))
}

myfunc2 <- function(x, y) {
  print(x * y)
}

myfunc(10)
myfunc2(10, 2)

c2f <- function(c) {
  return(c * (9 / 5) + 32)
}

print(c2f(30))

# vector
c <- c(1, 2, 3)
is(c)

s <- c("1", 2, "3")  # all elements casting to character
is(s)

d <- seq(1, 10, 2)  # numeric vector
is(d)

d[3]
d[3:4]

# factor
gender <- c("M", "F", "F", "M", "F")
print(gender)

gender <- factor(gender)
print(gender)

level <- c("novice", "intermediate", "advanced")
print(level)
level <- factor(level)
print(level)
level <- factor(c("novice", "intermediate", "advanced"),
                order = T,
                levels = c("novice", "intermediate", "advanced"))  # order levels
print(level)

level <- factor(c("novice", "intermediate", "advanced"),
                order = T,
                levels = c("advanced", "novice", "intermediate"))
print(level)

# matrix
m <- matrix(
  c(6, 3, 8, 5, 0, 9),
  nrow = 3,
  ncol = 2,
  byrow = TRUE  # fill matrix by rows (compare)
)
print(m)
m <- matrix(
  c(6, 3, 8, 5, 0, 9),
  nrow = 3,
  ncol = 2,
  byrow = FALSE  # fill matrix by column
)
print(m)
print(m[3, 2])
print(m[, 2])
print(m[1,])

# local processing
dimnames(m) <- list(c("r1", "r2", "r3"), c("c1", "c2"))
print(mean(m[, 2]))  # access by column number
print(mean(m[, "c2"]))  # access by column name

rownames(m) <- c("row1", "row2", "row3")
print(m)

colnames(m) <- c("column1", "column2")
print(m)

phy <- matrix(
  c(18, 170, 62, 20, 182, 68, 36, 178, 79, 44, 165, 63),
  nrow = 4,
  ncol = 3,
  byrow = TRUE
)
dimnames(phy) <- list(c("kim", "lee", "lim", "jo"), c("age", "height", "weight"))
print(phy)

mean(phy[, "age"])
mean(phy[, "height"])
mean(phy[, "weight"])

# array (same data type)
a <- array(1:24, c(2, 2, 6))
print(a)

# list (different type)
list <- list(c(1, 2, 3), c("good", "bad"), list(c(4, 5, 6), c("a", "b")))
print(list)

# data.frame()
d1 <- c(1, 2, 3, 4)
d2 <- c("kim", "lee", "kwon", "choi")
d3 <- c(20, 21, 22, 23)
d4 <- data.frame(id = d1, name = d2, age = d3)
print(d4)

id <- c(1:10)
gender <- c("M", "F", "F", "M", "M", "F", "M", "F", "M", "F")
brand <- c("Samsung", "Samsung", "Apple", "Apple", "LG", "Apple", "LG", "Samsung", "Apple", "LG")
coffee <- c("Cappuccino", "Americano", "Latte", "Latte", "Americano", "Latte", "Cappuccino", "Cappuccino", "Americano", "Cappuccino")
movie <- c("Horror", "Horror", "Comedy", "Action", "Horror", "Action", "Comedy", "Comedy", "Drama", "Drama")

DF_student_info <- data.frame(id, gender, brand, coffee, movie)
print(DF_student_info)

# bind
add <- c(5, "pink", 24)
d5 <- rbind(d4, add)
print(d5)

gender <- c("M", "F", "F", "M")
d6 <- cbind(d4, gender)
print(d6)