library(tidyverse)
library(tidyr)
library(dplyr)
library(esquisse)


tidy_data <- sportsref_download.xls[-c(1),] %>%
  subset(select = -c(X.1, X.2, Top.Players, X.11, X.12, X.13, X.18, Simple.Rating.System, X.19, X.20, X.21, X.22 )) %>%
  rename( #rename columns
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

tidy_data <- tidy_data[-(34:91),]

View(tidy_data)

esquisser(data = tidy_data, viewer = "browser")
