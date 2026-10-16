Question #1 : Is there an association between comfort levels and courses taken?
  - Variables: prog.comf, math.comf, stat.comf (comfort levels 1-5) and upper_div_courses, all from background-clean.csv
  - Data Prep: Only 2 students were in the 3-5 group, so we combined 3-5 and 6-8 into "8 or fewer" and compared it against "9+" (21 vs 30 students)
  - Summaries/Plots and Others: Table of average comfort by group, a boxplot with jittered points for each comfort type, and a Wilcoxon rank-sum test for each comfort type since comfort is an ordinal 1-5 rating (used instead of Chi-Square/ANOVA because of small groups and few distinct rating values)
  - Limitation: Most students are in the 9+ group and most comfort ratings are 3-5, which makes it difficult to detect differences. Course count also doesn't tell us which courses were taken.

Question #2 :Is there an association between programming language preference and a student's career track orientation (Industry-only vs. Lab-inclined)?
1. Variables: "type", "language", "response_id", "domains"
- Fixed Responses: Language choices are strictly "Python", "R", and "No preference".

2. Data Prep: Recode type into two groups: "Industry Only" (ind) versus "Lab-Inclined" (combining lab and both).

3. Summaries & Plots: $2 \times 3$ contingency table, Chi-Square test of independence (with Fisher's Exact Test fallback as expected cell counts remain sparse for a box), and a 100% proportion-filled bar chart.

4. Key Choices to Check: The code recodes type into two groups, which with "both" being assigned to the "Lab-Inclined" group.

4. Limitation: Grouping students who chose "both" with "lab" balances group totals so Chi-Square can be ran, but groups flexible students as having an affinity for academic lab work.

Question #3 : Are there distinct "types" of students hiding in the interest data?
1. Variables: The code reads background-clean.csv and interest-clean.csv. It uses areas from the interest dataset to analyze students' data science interests, language to compare programming language preferences, and type to compare project goal preferences. A student row number is created from the order of rows in interest to connect each student's interests and cluster assignment to their language and project goal preferences.
2. Data Prep: The code splits the comma-separated areas responses into individual rows, removes the word "generally" and extra spaces, and filters out missing or empty interest labels. It counts the cleaned interest areas and creates binary columns indicating whether each student selected each interest. The code uses these binary columns as input for k-means clustering and PCA.
3. Summaries/Plots and Other things:
- Interest bar chart: Shows the number of students selecting each data science interest area.
- K-means clustering: Groups students into three clusters based on their binary interest selections, using set.seed(123).
- PCA scatterplot: Uses the first two principal components to visualize the students' clusters.
- Interest heat map: Shows the mean of each binary interest variable within each cluster, expressed as a percentage, to compare interest selections across clusters.
- Programming language bar chart: Uses proportion-filled bars to compare programming language preferences across the three clusters.
- Project goal bar chart: Uses proportion-filled bars to compare project goal preferences, represented by type, across the three clusters.
4. Key Choices to Check: The code sets the number of k-means clusters to three and uses the first two principal components for the scatterplot. The heat map calculates the mean of each binary interest variable within each cluster. The language and project goal comparisons connect cluster assignments to students using row numbers. These comparisons assume that the row order in the interest dataset remains consistent when the cluster assignments are joined back to the student records.
5. Limitation: The analysis uses k-means clustering on binary interest selections with three clusters specified in advance. The resulting clusters depend on this choice, and the PCA scatterplot only displays the first two principal components. The analysis is exploratory and does not establish why students select particular interests or preferences.
