library(tidyverse)

background <- read_csv('data/background-clean.csv', show_col_types = FALSE)
interest <- read_csv('data/interest-clean.csv', show_col_types = FALSE)
metadata <- read_csv('data/survey-metadata.csv', show_col_types = FALSE)


background %>%
  ggplot(aes(x = upper_div_courses, y = prog.comf)) +
  geom_boxplot() +
  labs(x = 'Number of Upper Division Courses', y = 'Programming Comfort Level') +
  theme_minimal()

background %>%
  ggplot(aes(x = upper_div_courses, y = math.comf)) +
  geom_boxplot() +
  labs(x = 'Number of Upper Division Courses', y = 'Math Comfort Level') +
  theme_minimal()

background %>%
  ggplot(aes(x = upper_div_courses, y = stat.comf)) +
  geom_boxplot() +
  labs(x = 'Number of Upper Division Courses', y = 'Stats Comfort Level') +
  theme_minimal()