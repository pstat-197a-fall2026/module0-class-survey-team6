Is there an association between comfort levels and courses taken?
- I think this would be neat since it might show if there's more comfort after taking more courses. Which is what I would expect.

Is there an association between Programming language preference and Lab vs Industry interest or a particular industry?
  - Variables: type, language, response_id, domains 
    All of these are in interest-clean.csv
  - Data Prep: Probably remove those with neither/both to make the comparison easier and binary (so filter into just lab and ind)
  - Summaries/Plots and Other things:
  -- Contingency table and Chi-Sq Test for independence to test whether programming language preference and type are associated (if our p value is less than 0.05 we reject ind.)
  -- Proportion filled bar chart would be cool to compare breakdowns
  - Limitation: Excluding both in this scenario drops some data.

Are there distinct "types" of students hiding in the interest data?
  - Method: turn the 11 areas options into yes/no columns and cluster the students (hierarchical clustering or k-modes), or reduce with PCA/MCA and plot. What I'd look for: whether a "modern ML" group (deep learning, images, NLP, deployment) separates from a "classical stats" group (inference, time series, visualization). Follow-up: check whether the clusters differ in language preference or in industry vs. lab.