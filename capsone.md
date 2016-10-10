Data Science Capsone Poject
========================================================
author: York Huang
date: 10/10/2016
autosize: true

I Objectives
========================================================

The purpose of this capstone project is to build a shiny application that predicts the next word.

- Use n-gram and R packages to build the model
- Consider back-off situation
- Create Shiny application that read in user typing and predict the next word.

II Model Algorithm
========================================================

1. Read data from blogs, twitter and news to create Corpora data. This includes cleansing data by removing non UTF-8 characters,
   extra spaces, numbers and punctuations.

2. Create n-gram from the corpora. 3-gram is used.

3. Calculate the frequency and filter the small frequency 3-grams.

4. Save the model to external file.


III Predict Algorithm
========================================================

1. Read the model data.

2. Use the 3-gram to look for the matched 3-grams.

3. Use frequency as weight to randomly pick one matched 3-grams and return.

4. If there is no matched 3-gram, look for the 2-gram within the 3-grams. This is the back-off behavious.

5. If there is still nothing matched. return empty.

IV Shiny Application
========================================================

1. Open the shiny link https://yorkhuang-au.shinyapps.io/capprj/

2. Type in any text in the textbox.

3. The 1st time will take a while. And the predicted next word is automatically shown up.

4. You can keep typing and next word keeps changing.

5. The same text may be predicted with different next word as it is depended on frequency.

