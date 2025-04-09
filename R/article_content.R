## Packages ----

library(readr)
library(dplyr)
library(gtsummary)
library(ggstatsplot)
library(ggplot2)
library(summarytools)

## Read data ----

article_data <- read_rds("data/article_data.rds")


## Summary table ----

article_data |> 
  select(sex, edad, joy, Course, niko.nikos, icon, kudos, Mark) |> 
  tbl_summary(by = niko.nikos)


## Plot niko-niko ----

article_data |> 
  mutate(niko.nikos = factor(niko.nikos)) |> 
  ggbarstats(icon, niko.nikos, bf.message = FALSE, type = "nonparametric",
                    proportion.test = FALSE, results.subtitle = FALSE,
                    legend.title = "Mood") +
  labs(x = label(article_data$niko.nikos),
       title = "Mood vs. the use of Niko-Niko")



## Table niko-niko ----

ctable(article_data$icon, article_data$niko.nikos, prop = "c",
       headings = FALSE)

## Plot kudos ----

article_data |> 
  ggbetweenstats(joy, kudos, 
                 bf.message = FALSE, 
                 type = "n") +
  labs(x = "Joy mood selected",
       y = "Number of kudos given",
       title = "Number of kudos vs. Joy mood")



