#Question 1    # #####

#to import the package, go to the console and type "install.packages("coronavirus")

install.packages("coronavirus")
install.packages("dplyr")
library(coronavirus)
library(dplyr)
library(plotly)
head(coronavirus,n=100)

#The first column of the data is simple, its just the date. It is in ascending order, starting on 
#January 22nd, 2020. The second column is the province that the data is taken from within a specific country.
#The third column is the country that the data is taken from. The 4th and 5th columns are latitude and longidude
#respectfully of the location where the data was taken from. The 6th and 7th columns 
#represent the type (meaning confirmed or unconfirmed) and number of cases on the day the data
#was taken, respecfully. 


#Question 2    # #####
install.packages("dplyr")

#Total Confirmed Cases by Country (Top 20)

library(dplyr)

summary_df <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

summary_df %>% head(20) 



#Display the top 5 countries in a bar graph, with the x-axis being the country 
#names and the y-axis being the number of total cases.


library(dplyr)

summary_df_5 <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)
summary_df_5 %>% head(5)#this displays the top 5 in a list


library(plotly)

conf_df <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases) %>%
  mutate(parents = "Confirmed") %>%
  ungroup() 
conf_df %>% head(5)


plot(conf_df,
     "o",
     xlab = "country names", #This was working for a while on my r stuido until I got ready to submit and then it started giving me an error code even though I didn't change it.
     ylab = "# total cases", 
     main = "Top 5 Countries by Total Cases",
     col = "black")

#Flip the bar graph so it is a horizontal bar plot
library(plotly)

conf_df <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases) %>%
  mutate(parents = "Confirmed") %>%
  ungroup() 
conf_df %>% head(5)

plot_ly(data = conf_df,
        type= "bar plot",
        values = ~total_cases,
        labels= ~ country,
        parents=  ~parents,
        domain = list(column=0),
        name = "Confirmed",
        textinfo="label+value+percent parent",
        las = 1) #Attempted to get the "las" command to work, couldn't quite get it to flip the graph how I wanted it to.



#Add a title to the bar graph - "Top 5 countries by total cases"

library(plotly)

conf_df <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases) %>%
  mutate(parents = "Confirmed") %>%
  ungroup() 
conf_df %>% head(5)


plot(conf_df,
     "o",
     xlab = "country names", #This was working for a while on my r stuido until I got ready to submit and then it started giving me an error code even though I didn't change it.
     ylab = "# total cases", 
     main = "Top 5 Countries by Total Cases",
     col = "black") 
#Again, this was working until I tried to submit and then got an error code, online research
#tells me that this error code is a glitch in R studio and that my code is actually correct
#so I truly dont know how to fix it.






#Question 3    # #####
#a. Create a data frame called recent_cases which represents the confirmed number of cases sorted by dates.

library(dplyr)

recent_cases <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(date) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(date)
recent_cases


#b. Show the recent_cases data in a line graph, with the dates being on the 
#x-axis and number of confirmed cases on the y-axis

plot(v,type,col,xlab,ylab)

plot(recent_cases,
     "o",
     xlab = "dates", 
     ylab = "# confirmed cases", 
     main = "recent_cases line graph",
     col = "dark orange")

#Extra Credit
#1. Added Orange Color
#2. Added Main Title
#3. Added X Axis Label
#4. Added Y Axis Label
#5. Added line connecting the dots













