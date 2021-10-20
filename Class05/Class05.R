# Class 5 data visulaization 
#In thi sclass we are going ot learn and go over ggplot2 dta package 

#you have to call ggplot2 everytime you go to use it- go to libary and load
# use library(ggplot2)
#now builiding a ggplot wiht the cars data that is a fearure of R
#all ggplots have at least 3 layers
  #data + aes + geoms
library(ggplot2)
head(cars)
#ggplot(data=cars) + aes(x=speed, y=dist) + geom_point()
ggplot(data=cars) + 
  aes(x=speed, y=dist) + 
  geom_point()

ggplot(data=cars) + 
  aes(x=speed, y=dist) + 
  geom_point() + 
  labs(tittle="Stoping distance of old cars", 
       x="Speed (MPH)",
       y="Distance (Feet)")

ggplot(data=cars) + 
  aes(x=speed, y=dist) + 
  geom_point() + 
  geom_smooth() +
  labs(tittle="Stoping distance of old cars", 
       x="Speed (MPH)",
       y="Distance (Feet)")

#ggplot is not the only graphics system, a very popular one id "base" R graphics
plot(cars)
#now time for the class lab worksheet stuff

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
#Playing around with this genes dataframe to understand
head(genes)
nrow(genes)
colnames(genes)
ncol(genes)
table("State")
table(genes$State)
#How many genes are upregulated? Rounded to the 2nd sig fig
round(table(genes$State)/nrow(genes)*100,2)

#taking this dataset for genes and working up in ggplot
ggplot(data=genes) + 
  aes(x=Condition1, y=Condition2, col= State) + 
  geom_point() 
#Save the basic pieces as p so it is eaiser to build and add lines
p <-ggplot(data=genes) + 
  aes(x=Condition1, y=Condition2, col= State) + 
  geom_point() 
p + scale_color_manual(values = c( "blue", "grey","red"))

p <-ggplot(data=genes) + 
  aes(x=Condition1, y=Condition2, col= State) + 
  geom_point() + 
  scale_color_manual(values = c( "blue", "grey","red"))
p + labs(title= "Gene Expression Changes Upon Drug Treatment", 
         x= "Control (no drug)", 
         y= "Drug Treatment")

#now doing stuff with the dataset gapminder
#install.packages("gapminder")

library(gapminder)

head(gapminder)

# lets make a new plot of life vs. life exp 

ggplot(gapminder) +
  aes(x=year, y=lifeExp, col= continent) +
  geom_jitter(width= 0.4, alpha= 0.2) +
 geom_violin(aes(group=year), alpha=0.2, draw_quantiles = 0.5)
  geom_point()
#this didnt quite work and I got behind on the section^^, look at his page for reference 
  
  #Install the plotly 
  #install.packages("plotly")
  
  