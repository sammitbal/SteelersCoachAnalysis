#load packages
library(tidyverse)
library(tidyr)
library(dplyr)
library(esquisse)


#dataset contains all basic team information as well as points and yard ranks
#tidy dataset 

#get rid of top row
tidy_data <- sportsref_download.xls[-c(1),] %>%
  #delete unnecessary columns
  subset(select = -c(X.1, X.2, Top.Players, X.11, X.12, X.13, X.18, Simple.Rating.System, X.19, X.20, X.21, X.22 )) %>%
  #renames columns
  rename( 
    Year = X, 
    Wins = X.3,
    Loses = X.4, 
    Ties = X.5,
    Div_fin = X.6,
    Playoffs = X.7,
    Total_points = Points,
    Points_allowed = X.8,
    Point_diff = X.9,
    Coaches = X.10, 
    OffPtsRNK = Off.Rank,
    OffYdsRNK = X.14,
    DefPtsRNK = Def.Rank,
    DefYdsRNK = X.15,
    TurnRNK = Overall.Rank,
    PtsDiffRNK = X.16,
    YdsDiffRNK = X.17) %>%
  #mutates or changes the data type of the column
  #this helps with graphing and making sure the data is being represented correctly
  mutate(Year = as.integer(Year)) %>%
  mutate(Wins = as.integer(Wins)) %>%
  mutate(Loses = as.integer(Loses)) %>%
  mutate(Ties = as.integer(Ties)) %>%
  mutate(Total_points = as.integer(Total_points)) %>%
  mutate(Points_allowed = as.integer(Points_allowed)) %>%
  mutate(Point_diff = as.integer(Point_diff)) %>%
  mutate(OffPtsRNK = as.integer(OffPtsRNK)) %>%
  mutate(OffYdsRNK = as.integer(OffYdsRNK)) %>%
  mutate(DefPtsRNK = as.integer(DefPtsRNK)) %>%
  mutate(DefYdsRNK = as.integer(DefYdsRNK)) %>%
  mutate(TurnRNK = as.integer(TurnRNK)) %>%
  mutate(PtsDiffRNK = as.integer(PtsDiffRNK)) %>%
  mutate(Year = as.integer(Year)) %>%
  mutate(Wins = as.integer(Wins)) %>%
  mutate(Loses = as.integer(Loses)) %>%
  mutate(Ties = as.integer(Ties)) %>%
  mutate(Total_points = as.integer(Total_points)) %>%
  mutate(Points_allowed = as.integer(Points_allowed)) %>%
  mutate(Point_diff = as.integer(Point_diff)) %>%
  mutate(OffPtsRNK = as.integer(OffPtsRNK)) %>%
  mutate(OffYdsRNK = as.integer(OffYdsRNK)) %>%
  mutate(DefPtsRNK = as.integer(DefPtsRNK)) %>%
  mutate(DefYdsRNK = as.integer(DefYdsRNK)) %>%
  mutate(TurnRNK = as.integer(TurnRNK)) %>%
  mutate(YdsDiffRNK = as.integer(YdsDiffRNK))

#keeps data from years 1992 to 2024 only 
tidy_data <- tidy_data[-(34:91),]

View(tidy_data)



#creating graphs to compare tomlin and cowher
esquisser(data = tidy_data, viewer = "browser")



##data set contains steelers revenue_data
revenue_data <- steelersrevenue[-c(1,2,3),] %>%
  #renaming columns
  rename(Year = V1,
         Revenue.Million = V2) %>%
  #changing data type
  mutate(Year = as.integer(Year))
  
#adding revenue data to original dataset
merged_tidy_data <- tidy_data %>%
  left_join(revenue_data, by = "Year")
  

View(merged_tidy_data)


#graph compares wins between coaches

ggplot(tidy_data) +
  aes(x = Wins, colour = Coaches) +
  geom_histogram(bins = 30L, fill = "#112446") +
  scale_color_manual(
    values = c(Cowher = "#F8766D",
               Tomlin = "#61E0FF")
  ) +
  theme_minimal() +
  scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10))

#graphs compares total points scored and wins

ggplot(tidy_data) +
  aes(x = Wins, y = Total_points, colour = Coaches) +
  geom_point(size = 3L, shape = "bullet") +
  scale_color_manual(
    values = c(Cowher = "#F8766D",
               Tomlin = "#61E0FF")
  ) +
  theme_minimal() +
  scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10))

#graph compares total points and years

ggplot(tidy_data) +
  aes(x = Year, y = Total_points, colour = Coaches) +
  geom_line() +
  scale_color_hue(direction = 1) +
  theme_minimal()


# off pts rank 

ggplot(tidy_data) +
  aes(x = Year, y = OffPtsRNK, colour = Coaches) +
  geom_line() +
  scale_color_hue(direction = 1) +
  theme_minimal()

#def pts rnk

ggplot(tidy_data) +
  aes(x = Year, y = DefPtsRNK, colour = Coaches) +
  geom_line() +
  scale_color_hue(direction = 1) +
  theme_minimal()

#points allowed

ggplot(tidy_data) +
  aes(x = Year, y = Points_allowed, colour = Coaches) +
  geom_line() +
  scale_color_hue(direction = 1) +
  theme_minimal()

# off yds rank and def yds rank

ggplot(tidy_data) +
  aes(x = OffYdsRNK, y = DefYdsRNK, colour = Coaches) +
  geom_line() +
  scale_color_hue(direction = 1) +
  theme_minimal()

#added div finish

ggplot(tidy_data) +
  aes(x = Div_fin, colour = Coaches) +
  geom_bar(fill = "#112446") +
  scale_color_hue(direction = 1) +
  theme_minimal()


#added playoff runs
ggplot(merged_tidy_data) +
  aes(x = Playoffs, colour = Coaches) +
  geom_bar(fill = "#112446") +
  scale_color_hue(direction = 1) +
  labs(x = "Playoff Appearances", y = "Count") +
  theme_minimal()

#added revenue graph
merged_tidy_data %>%
  filter(Year >= 2000L & Year <= 2024L) %>%
  ggplot() +
  aes(x = Year, y = Revenue.Million, colour = Coaches) +
  geom_point() +
  scale_color_hue(direction = 1) +
  theme_minimal()
