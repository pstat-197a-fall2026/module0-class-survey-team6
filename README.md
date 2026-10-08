# module0-class-survey

This is a template repository for a group assignment to produce a descriptive analysis of class survey data.

Repository contents:

-   `data` contains survey responses on each of two sections stripped of identifying information, and a metadata file with variable names and descriptions
-   `scripts` contains the code to produce the results shown in class
-   `results` contains a template called `report.qmd` with some instructions about what to include in write-ups

Assignment instructions:

1.  Coordinate with your group on questions to explore and assign tasks. Not all tasks need to involve analyzing the data. For example, writing up results will be a task that may pair well with coordinating group activity. Working on tasks in pairs is recommended.
2.  Carry out your analysis in R scripts and store these in the `scripts` folder; if each person works on their own script, the potential for merge conflicts should be minimized and branches won't be necessary. Your scripts can be pretty messy; think of them as scratch work.
3.  Pool findings and decide what to include in your write-up. Prepare the write-up by modifying `report.qmd` .
4.  When your write-up is complete, render the document and then push changes to the main branch of your group repository. This **counts as your submission**. You can continue to make changes until the due date. Changes made after the due date may be made but are not guaranteed to receive review.

Remarks:

-   in general, your scripts will not be reviewed in detail, but they are important to include as a record of your work;

-   you can request feedback from a TA on work in progress by directing them to a script and/or a commit;

-   you will be evaluated in part on your individual contributions based on the commit history of your group's repository, so **make sure your contributions are recorded in the commit history somehow**; your commits may pertain to scripts or the write-up and may be on the main branch or a separate branch;

-   consider using the *Issues* feature to assign tasks and track work


Potential Questions:
- Is there an association between comfort levels and courses taken?
- Is there an association between Programming language preference and Lab vs Industry interest or a particular industry?





Praveen questions:
1. Are there distinct "types" of student hiding in the interest data?

Method: turn the 11 areas options into yes/no columns and cluster the students (hierarchical clustering or k-modes), or reduce with PCA/MCA and plot.
What I'd look for: whether a "modern ML" group (deep learning, images, NLP, deployment) separates from a "classical stats" group (inference, time series, visualization).
Follow-up: check whether the clusters differ in language preference or in industry vs. lab.

2. What distinguishes students who have research experience?

Method: classify research (Yes vs. No) from comfort and proficiency ratings, course indicators, domain_specialization, and interests, using lasso logistic regression or a small decision tree.
Why this one: it is the best-balanced outcome in the data (23 Yes, 24 No, 4 Unsure), so accuracy is easy to interpret against a roughly 50% baseline.
What I'd look for: which predictors survive the lasso, such as advanced electives (PSTAT 134, 174, 175) or a preference for lab over industry.

3. Can you tell a Python person from an R person by their background?

Method: classify language (22 Python, 11 R, 16 no preference) from courses, programming comfort, and interest areas, using a random forest or multinomial logistic regression and reading off variable importance.
What I'd look for: whether CS 16, programming comfort, or deep learning interest pushes toward Python, and inference or visualization interest toward R.
How it differs from the README question: that one asks whether language is associated with industry vs. lab; this asks what predicts the language preference itself.

