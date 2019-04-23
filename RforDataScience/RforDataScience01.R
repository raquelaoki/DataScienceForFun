if(!require(tidyverse)) install.packages("tidyverse")
if(!require(nycflights13)) install.packages("nycflights13")
if(!require(Lahman)) install.packages("Lahman")
if(!require(gapminder)) install.packages("gapminder")

tidyverse_update()

##Chapter 3 - Data Visualization 

mpg #tibble table dput(mpg)
ggplot(data = mpg) + 
  geom_point(mapping=aes(displ,y=hwy)) #mapping = aes(x = x, y = y)

#Exercise 