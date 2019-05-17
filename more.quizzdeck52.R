## 1(a-b)
##build the columns, in to vectors

color <- c(rep('black', 26), rep('red', 26))
suit<-c(rep("clubs",13),rep("spades",13),rep("diamonds",13),rep("hearts",13))
name<-paste(rep(c("ace",2:10, c("jack","queen", "king")),4))
value<-rep(c(c(1:9),rep(10,4)),4)
rank<-c(rep(1:13,4))

## check for each vector(column) length
length(color)

length(name)
length(suit)

length(value)

length(rank)
## 1. (c - e)

## check for dimension

dim(deck52)
# creating a dataframe which is similar to arrays and tables

deck52 <- data.frame(color, suit, name, value, rank)

deck52

## converting the column names from Lowercase to Uppercase

names(deck52) <- toupper(names(deck52))

names(deck52)

## 2.transferring same dataframe to mydeck2.

mydeck2 <- data.frame(COLOR = c(rep('black', 26), rep('red', 26)), SUIT = c(rep("clubs",13),rep("spades",13),rep("diamonds",13),rep("hearts",13)), NAME = paste(rep(c("ace",2:10, c("jack","queen", "king")),4)), VALUE = rep(c(c(1:9),rep(10,4)),4), RANK = c(rep(1:13,4)))

## 3. variable comparison test / equality test
deck52==mydeck2

identical(deck52, mydeck2)


### explaining the difference between '==' & identical().
# using '==' compares the 'mydeck2 and 'deck52' dataframes to check each variable for similarities.
# while identical()test two objects are exactly equal it either returns FALSE in summary or TRUE. It returned TRUE because the data is duplicated.






##more deck52 with SQL

B <- subset(deck52, color == 'black')
R <- subset(deck52, color == 'red')
D <- subset(deck52, suit == 'diamonds')
H <- subset(deck52, suit == 'hearts')
S <- subset(deck52, suit == 'spades')
C <- subset(deck52, suit == 'clubs')
F <- subset(deck52, rank > 10)
A <- subset(deck52, value < 2)
ODD <- subset(deck52, value %%2 ==1 & rank)
EVEN <- subset(deck52, value %%2 ==0 & rank)

#a.
P_H <- dim(H)[1]
Cards <- dim(deck52)[1]

PH <- P_H/Cards
PH
## P(H) = .25

#b.
PF <- dim(F)[1]/Cards
PF
## P(F) = .23
#c.
PODD <- dim(ODD)[1]/Cards
PODD
##PODD = .38
#d.
PEVEN <- dim(EVEN)[1]/Cards
PEVEN
##P(EVEN) = .615
#e.
ODDC <- subset(deck52, value %%2 !=1 & rank)
PODDc <- dim(ODDC)[1]/Cards #compliment of ODD number cards
PODDc
##P(ODDc) = .615
#f.
PD <- dim(D)[1]/Cards
PD
##P(D) = .25
#g.
DnR <- subset(deck52, suit =="diamonds" & color=="red")
DnR
PDnR <- dim(DnR)[1]/Cards
PDnR
##P(DnR) = .25
#h.
PR <- dim(R)[1]/Cards
PR
PDorR <- PDnR/PR
PDorR
##P(D|R) = .5

#i
D
PDuR <- nrow(subset(deck52, SUIT == 'diamonds' | COLOR == 'red'))
P_DuR <- PDuR/Cards
##P(DUR) = 0.5 


#j.

FnEVEN <- subset(deck52, rank > 10 & (value %%2 ==0))
PFnEVEN <- (nrow(FnEVEN)/(Cards))/PEVEN
PFnEVEN
##P(F|EVEN) = .375

##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>##
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>##

## Part 4. 10x3 data.frame called mypart3
myp1 <-data.frame (question='3(a)',probability = 'P(H)', answer= .25)
myp2 <-data.frame (question='3(b)',probability = 'P(F)', answer= .23)
myp3 <-data.frame (question='3(c)',probability = 'P(ODD)', answer= .38)
myp4 <-data.frame (question='3(d)',probability = 'P(EVEN)', answer= .615)
myp5 <-data.frame (question='3(e)',probability = 'P(ODDc)', answer= .615)
myp6 <-data.frame (question='3(f)',probability = 'P(D)', answer= .25)
myp7 <-data.frame (question='3(g)',probability = 'P(DnR)', answer= .25)
myp8 <-data.frame (question='3(h)',probability = 'P(D|R)', answer= .5)
myp9 <-data.frame (question='3(i)',probability = 'P(DUR)', answer= .5)
myp10 <-data.frame (question='3(j)',probability = 'P(F|EVEN)', answer= .375)
mypart3 <-rbind (myp1,myp2,myp3,myp4,myp5,myp6,myp7,myp8,myp9,myp10)
mypart3

##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>##
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>##

## Part 5:(Repeat of part 2 SQL extract) sqldf() subsetting and counting

B <- 'SELECT * FROM deck52 where COLOR = "black"'
sqldf(B)

R <- 'SELECT * FROM deck52 where COLOR = "red"'
sqldf(R)

D <- 'SELECT * FROM deck52 where SUIT = "diamonds"'
sqldf(D)

H <- 'SELECT * FROM deck52 where SUIT = "hearts"'
sqldf(H)

S <- 'SELECT * FROM deck52 where SUIT = "spades"'
sqldf(S)

C <- 'SELECT * FROM deck52 where SUIT = "clubs"'
sqldf(C)

F <- 'SELECT * FROM deck52 where RANK > "10"'
sqldf(F)

A <- 'SELECT * FROM deck52 where VALUE < "2"'
sqldf(A)


ODD <- 'SELECT * FROM deck52 where VALUE % 2 == 1'
sqldf(ODD)

##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>##

## Part 5:(Repeat of part 3 SQL extract of probabilities) sqldf() subsetting and counting





EVEN <- 'SELECT * FROM deck52 where VALUE % 2 == 0'
sqldf(EVEN)


#----------------------------------------------------------------------------
#-----------------------------------------------
## SQL part##





extract = 'SELECT * FROM deck52'
#where suit='diamonds' and color = 'red'
sqldf(extract)

qstr <- 'SELECT FROM WHERE'
#qstr <- "SELECT top 1 * FROM deck52'
qstr <- 'SELECT *FROM deck52'
sqldf(qstr)[1:3,] # 1st three rows of the query
qstr <- 'SELECT * FROM deck52 where COLOR ="red" and SUIT = "diamonds"'
sqldf(qstr)
qstr <- 'SELECT count(*) FROM deck52 where COLOR ="red" and SUIT = "diamonds"'
sqldf(qstr)
qstr <- 'SELECT count(*)FROM deck52 where COLOR ="red" and SUIT = "diamonds"group by value'
sqldf(qstr)

qstr <- 'SELECT count(*) as number FROM deck52 where COLOR ="red" and SUIT = "diamonds"group by value'

qstr <- 'SELECT count(*) as number.max(RANK)as toprank  FROM deck52 where COLOR ="red" and SUIT = "diamonds"group by value'

