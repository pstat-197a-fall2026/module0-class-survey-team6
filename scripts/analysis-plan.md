Is there an association between comfort levels and courses taken?
  - Variables: .comf levels as integers and upper_div_courses (the factor), and potentially the list of courses
  - Data Prep: Pairing the list of courses with the same ID as the comfort levels and count of upper div courses
  - Summaries/Plots and Others: Chi-Squared for categorical comfort levels and upper_div_courses or ANOVA for continuous comfort levels and upper_div_courses. Can also visualize with boxplots or bar charts.
  - Limitation: Most of the upper div courses factor is homogenous, with very few in the smallest range, which might make it difficult to detect differences.

Is there an association between Programming language preference and Lab vs Industry interest or a particular industry?
  - Variables: type, language, response_id, domains 
    All of these are in interest-clean.csv
  - Data Prep: Probably remove those with neither/both to make the comparison easier and binary (so filter into just lab and ind)
  - Summaries/Plots and Other things:
  -- Contingency table and Chi-Sq Test for independence to test whether programming language preference and type are associated (if our p value is less than 0.05 we reject ind.)
  -- Proportion filled bar chart would be cool to compare breakdowns
  - Limitation: Excluding both in this scenario drops some data.

Are there distinct "types" of students hiding in the interest data?
1. Variables: areas and language from interest-clean.csv. The areas variable contains students' selected data science interests, and language records their programming language preferences.
   
2. Data Prep: Split the comma separated interest areas into individual rows, remove extra spaces, filter out missing or empty interests, and covert the interest areas into binary yes/no columns, where 1 indicates a selected interest and 0 indicates an unselected interest.
4. Summaries/Plots and Other things:
   - Create a bar char showing the number of students selecting each data science interest area
   - Use k-means clustering with three clusters to group students based on their binary interest selections
   - Use PCA to reduce the interest data to two dimensions and create a scatterplot to visualize the clusters
   - Create a heat map showing the percentage of students in each cluster who selected each interest area.
   - Create a proportion-filled bar chart to compare programming language preferences across the clusters
5. Key Choices to Check: The code sets the number of clusters to three and uses the first two principal components for visualization. We should examine the heat map to determine whether the clusters represent different interest profiles. The cluster assignments must also be correctly connected to the student data before creating the heat map and comparing programming language preferences.
6. Limitation: 
  

  - Method: turn the 11 areas options into yes/no columns and cluster the students (hierarchical clustering or k-modes), or reduce with PCA/MCA and plot. What I'd look for: whether a "modern ML" group (deep learning, images, NLP, deployment) separates from a "classical stats" group (inference, time series, visualization). Follow-up: check whether the clusters differ in language preference or in industry vs. lab.
