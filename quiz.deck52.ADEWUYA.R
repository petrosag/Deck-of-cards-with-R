## 1(a-b)
##build the columns, in to vectors

color <- c(rep('black', 26), rep('red', 26))
suit<-c(rep("clubs",13),rep("spades",13),rep("diamonds",13),rep("hearts",13))
name<-paste(rep(c("ace",2:10, c("jack","queen", "king")),4))
value<-rep(c(c(1:9),rep(10,4)),4)
rank<-c(rep(1:13,4))

## check for each vector(column) length
> length(color)

> length(name)
> length(suit)

> length(value)

> length(rank)
## 1. (c - e)

## check for dimension

> dim(deck52)
# creating a dataframe which is similar to arrays and tables

deck52 <- data.frame(color, suit, name, value, rank)

> deck52

## converting the column names from Lowercase to Uppercase

> names(deck52) <- toupper(names(deck52))

> names(deck52)

## 2.transferring same dataframe to mydeck2.

mydeck2 <- data.frame(COLOR = c(rep('black', 26), rep('red', 26)), SUIT = c(rep("clubs",13),rep("spades",13),rep("diamonds",13),rep("hearts",13)), NAME = paste(rep(c("ace",2:10, c("jack","queen", "king")),4)), VALUE = rep(c(c(1:9),rep(10,4)),4), RANK = c(rep(1:13,4)))

## 3. variable comparison test / equality test
deck52==mydeck2

identical(deck52, mydeck2)


### explaining the difference between '==' & identical().
> # using '==' compares the 'mydeck2 and 'deck52' dataframes to check each variable for similarities.
  > # while identical()test two objects are exactly equal it either returns FALSE in summary or TRUE. It returned TRUE because the data is duplicated.

