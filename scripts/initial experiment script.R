#Just gonna copy paste some stuff from the lab for now


library(tidyverse)

# Load the current class data from this repository.
background <- read_csv('data/background-clean.csv', show_col_types = FALSE)
interest <- read_csv('data/interest-clean.csv', show_col_types = FALSE)
metadata <- read_csv('data/survey-metadata.csv', show_col_types = FALSE)

# CSVs store proficiency labels as text; define their order explicitly.
background <- background %>%
  mutate(across(ends_with('.prof'),
                ~ factor(.x, levels = c('beg', 'int', 'adv'), ordered = TRUE)))

nrow(background)

metadata %>%
  filter(data.file == 'background-clean.csv') %>%
  select(variable.name, variable.description, variable.type, values.notes)

background %>%
  filter(stat.prof == 'adv') %>%
  mutate(avg.comf = (math.comf + prog.comf + stat.comf)/3) %>%
  select(avg.comf, research) %>%
  summarize(prop.research = mean(research == 'Yes', na.rm = TRUE),
            med.comf = median(avg.comf, na.rm = TRUE))

# average comfort levels across shared background respondents
background %>%
  summarise(across(ends_with('.comf'), ~ mean(.x, na.rm = TRUE)))

# create a grouping
background %>%
  group_by(stat.prof)


# many variables, many summaries
comf_sum <- background %>%
  summarise(across(
    ends_with('.comf'),
    list(mean = ~ mean(.x, na.rm = TRUE),
         median = ~ median(.x, na.rm = TRUE),
         min = ~ min(.x, na.rm = TRUE),
         max = ~ max(.x, na.rm = TRUE)),
    .names = '{.col}_{.fn}'
  ))

comf_sum

course_responses <- background %>%
  select(response_id, courses) %>%
  separate_rows(courses, sep = ',\\s*') %>%
  mutate(courses = str_trim(courses)) %>%
  filter(!is.na(courses), courses != '') %>%
  distinct(response_id, courses)

course_responses

# count respondents selecting each course
classes <- course_responses %>%
  count(courses, name = 'n') %>%
  rename(class = courses) %>%
  mutate(proportion = n / nrow(background))

classes

fig <- classes %>%
  ggplot(aes(x = proportion, y = reorder(class, proportion))) +
  geom_point()

fig