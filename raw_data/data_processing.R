library(tidyverse)

setwd("~/git/SSAC2020/raw_data/")

df = read.csv("Stats_2018_2019.csv", stringsAsFactors = FALSE)
df_playoffs = read.csv("Playoffs_2017_2019.csv", stringsAsFactors = FALSE)

df_intl = read.csv("Players_NonUS.csv", stringsAsFactors = FALSE)
df_allstar = read.csv("AllStar_2018.csv", stringsAsFactors = FALSE) %>%
  mutate(AllStar = 1) %>%
  select(Player, AllStar)
df_olympics2016 = read.csv("Olympics_2016.csv", stringsAsFactors = FALSE) %>%
  select(Player, Olympics2016)
df_olympics2020 = read.csv("Olympics_2020_Finalists.csv", stringsAsFactors = FALSE) %>%
  mutate(OlympicsFinalist = Olympics.Finalist) %>%
  select(Player, OlympicsFinalist)

intl_players <- unique(df_intl$Player)

## Filter to all players who have played at least 60 games OR are "HighRated"
## High rated = either on the 2016 Olympics team, 2018-2019 AllStar, or 2020 Tokyo Finalist
df_clean <- df %>%
  left_join(df_olympics2016, by = "Player") %>%
  left_join(df_olympics2020, by = "Player") %>%
  left_join(df_allstar, by = "Player") %>% 
  replace_na(list(Olympics2016 = 0,
             OlympicsFinalist = 0, 
             AllStar = 0)) %>%  
  mutate(HighRated = Olympics2016 + OlympicsFinalist + AllStar) %>%
  filter((G >= 60) | (HighRated > 0)) %>% ## down to 239 players
  filter(!(Player %in% intl_players)) %>% 
  rename(WS_48 = WS.48)

df_clean[is.na(df_clean)] <- 0

position_dictionary <- df_clean[c("Player","Pos")] %>% group_by(Player) %>% summarize(first(Pos))
## US Playoffs appearances
df_playoffs_clean <- df_playoffs %>%
  left_join(df_olympics2016, by = "Player") %>%
  left_join(df_olympics2020, by = "Player") %>%
  left_join(df_allstar, by = "Player") %>%
  left_join(df_clean[c("Player","Pos")], by = "Player") %>%
  replace_na(list(Olympics2016 = 0,
                  OlympicsFinalist = 0, 
                  AllStar = 0)) %>% 
  mutate(HighRated = Olympics2016 + OlympicsFinalist + AllStar) %>%
  rename(WS_48 = WS.48)

(df_playoffs$Player)

write.csv(df_clean, "../NBA_data_2018_2019.csv", row.names = FALSE)
write.csv(df_playoffs_clean, "../NBA_data_playoffs_2017_2019.csv", row.names = FALSE)
