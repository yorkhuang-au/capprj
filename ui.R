# Capstone
# ui.R
# York Huang

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Data Science Capstone Project"),
  sidebarPanel(
    a("Document", href="http://rpubs.com/yorkhuang/217258"),
    div(""),
    a("Source Code", href="https://yorkhuang-au.shinyapps.io/capprj/")
  ),
  mainPanel(
    h3('Predict Next Word'),
    h3(''),
    textInput("input_str", "Please type your text here:", ""),
    h4('Next Word:'),
    h5(textOutput('predict_str'))
  )
))

