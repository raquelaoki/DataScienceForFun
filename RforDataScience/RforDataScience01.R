if(!require(tidyverse)) install.packages("tidyverse")
if(!require(nycflights13)) install.packages("nycflights13")
if(!require(Lahman)) install.packages("Lahman")
if(!require(gapminder)) install.packages("gapminder")

tidyverse_update()

##_ Chapter 3 - Data Visualization 

mpg #tibble table dput(mpg)
ggplot(data = mpg) + 
  geom_point(mapping=aes(displ,y=hwy)) #mapping = aes(x = x, y = y)

#Exercise 
dim(mpg)
?mpg
ggplot(data = mpg) + 
  geom_point(mapping=aes(hwy,y=cyl)) #mapping = aes(x = x, y = y)

##3.3
#Playing with color, size, shapes of dots 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class), color = 'blue')

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#Adding a if in the graph, very cool
ggplot(data = mpg) + geom_point(mapping = aes(x = hwy, y = cty, color = displ<5))
ggplot(data = mpg) + geom_point(mapping = aes(x = hwy, y = cty, color = displ))

##3.4 
#Split graphic using a third variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ class)

#Split graphic using two other variables
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

##3.6
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

