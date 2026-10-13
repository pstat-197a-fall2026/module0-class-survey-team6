Is there an association between comfort levels and courses taken?
  - Variables: .comf levels as integers and upper_div_courses (the factor), and potentially the list of courses
  - Data Prep: Pairing the list of courses with the same ID as the comfort levels and count of upper div courses
  - Summaries/Plots and Others: Chi-Squared for categorical comfort levels and upper_div_courses or ANOVA for continuous comfort levels and upper_div_courses. Can also visualize with boxplots or bar charts.
  - Limitation: Most of the upper div courses factor is homogenous, with very few in the smallest range, which might make it difficult to detect differences.

Is there an association between Programming language preference and Lab vs Industry interest or a particular industry?
  - 

Are there distinct "types" of students hiding in the interest data?
  - Method: turn the 11 areas options into yes/no columns and cluster the students (hierarchical clustering or k-modes), or reduce with PCA/MCA and plot. What I'd look for: whether a "modern ML" group (deep learning, images, NLP, deployment) separates from a "classical stats" group (inference, time series, visualization). Follow-up: check whether the clusters differ in language preference or in industry vs. lab.