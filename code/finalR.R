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
    YdsDiffRNK = X.17)
  
tidy_data <- tidy_data[-(34:91),]

esquisser(data = tidy_data, viewer = "browser")
