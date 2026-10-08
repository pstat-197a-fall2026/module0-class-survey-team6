library(tidyverse)

#Jotting down some of the team questions!

#Is there an association between comfort levels and number of courses taken?
  #I think this would be neat since it might show if there's more comfort after taking more courses. Which is what I would expect.
  #You would need the factor for upper div courses taken count and the comfort level, both of these things per student
#Is there an association between Programming language preference and Lab vs Industry interest or a particular industry?
  #I think this one would be neat because it might hint at if tech industry people like R or not.
  #You'd need prog language preference and lab vs industry interest, both of these things per student
#Is there an association between comfort level and a particular course taken?
  #I think this one would be neat because it might hint at if a particular course is more effective at teaching programming or math or stats.
#Connection between math and programming language preference?
#Connection between programming proficiency and comfort level?
#Are there different types of students hiding in the data? Unsupervised methods like clustering might help you find students who take a particular type of class or something like that.
    #Method: turn the 11 areas options into yes/no columns and cluster the students (hierarchical clustering or k-modes), or reduce with PCA/MCA and plot.
    #What I'd look for: whether a "modern ML" group (deep learning, images, NLP, deployment) separates from a "classical stats" group (inference, time series, visualization).
    #Follow-up: check whether the clusters differ in language preference or in industry vs. lab.
#What distinguishes students who have research experience?
#Can you tell a python student from an R student just from the classes they've taken or some other background?
#Is there an association between domains chosen and areas chosen. Ex. Is an Env Science domain student more interested in chosing an Env Science area?

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


#did prof just say almost everyone took 131? I haven't!

#took
background %>%
  filter(str_detect(courses, "131")) %>%
  nrow()
#didn't take
background %>%
  filter(!str_detect(courses, "131")) %>%
  nrow()