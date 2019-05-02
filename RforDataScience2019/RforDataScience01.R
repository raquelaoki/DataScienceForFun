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

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy),show.legend = FALSE) + 
  geom_point() + geom_smooth()

#exercises 
#Interesting comparison of small changes in the graphics 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy), show.legend = FALSE) + 
  geom_point()+ geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy), show.legend = FALSE) + 
  geom_point()+ geom_smooth(se = FALSE,mapping = aes(group = drv))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv), show.legend = FALSE) + 
  geom_point()+ geom_smooth(se = FALSE,mapping = aes(group = drv))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy), show.legend = FALSE) + 
  geom_point(mapping = aes(color = drv))+ geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy), show.legend = FALSE) + 
  geom_point(mapping = aes(color = drv))+
  geom_smooth(se = FALSE,mapping = aes(linetype= drv))


ggplot(data = mpg, mapping = aes(x = displ, y = hwy), show.legend = FALSE) + 
  geom_point(mapping = aes(color = drv))

#3.7 
#Transformations 
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

#produce the same plot 
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

#bar plot from values in a table 
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")


#summary in a plot (similar to a boxplot)
ggplot(data = diamonds) + 
  stat_summary( mapping = aes(x = cut, y = depth),
    fun.ymin = min, 
    fun.ymax = max,
    fun.y = median
  )

#Exercises 
#1) The default value is the mean()
ggplot(data = diamonds) + 
  stat_summary( mapping = aes(x = cut, y = depth) )


#2) bar plot is able to make transformations, col don't 
ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")


ggplot(data = demo) +
  geom_col(mapping = aes(x = cut, y = freq))

#3.8) Exercises 
#1) we can improving adding 'jitter'/random noise 
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = 'jitter')

#4) boxplot
ggplot(data = diamonds) + 
  geom_boxplot( mapping = aes(x = cut, y = depth))



#Chapter 5.6 

#stop use order() and use arange(), the correct function to order rows
#Exercise 
ex1a = flights %>% 
  group_by(flight) %>%
  summarize(
    n_early = mean(arr_delay>15),
    n_delay = mean(dep_delay<15),
  ) %>% 
  filter(n_early>.5,n_delay>0.5)

ex1b = flights %>%
  group_by(flight)%>%
  summarise(
    min = min(dep_delay),
    mean = mean(dep_delay)
  )%>%
  filter(min>10)%>%
  select(flight,mean)

ex1d = flights %>% 
  group_by(flight) %>%
  summarize(
    n_early = mean(arr_delay<=15),
    n2_late = mean(arr_delay>100)
  ) %>%
  filter(n_early>=0.95 & n2_late > 0.01 ) 

#https://r4ds.had.co.nz/transform.html#grouped-summaries-with-summarise
#I'm on chapter 5.6
