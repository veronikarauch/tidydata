shinyUI(fluidPage( 
    titlePanel("Calculate your BMI"), 
    sidebarLayout(
    sidebarPanel(
        h3('Input weight & height'),
        numericInput(inputId="Weight", label = "Weight (in kg)", 75, min = 0, max = 500, step = 1), 
        numericInput(inputId="Height", label = "Height (in meters)",1.8, min = 0, max = 400, step = 0.01 ),
        submitButton('Submit') 
    ), 
    mainPanel(
        tabsetPanel(
            tabPanel("Your BMI",  verbatimTextOutput("text1"),verbatimTextOutput("text2")),
            tabPanel("About BMI", p('BMI - the Body Mass Index is a measure to indicate body fat by calcualting  a persons weight in kilograms divided by the square of height in meters.'),p('It cannot not be used as a direct diagnostic tool but there appears to be a high correlation between BMI levels and various metabolic and disease outcome. Generally it is mostly used as an inicator
                           to determine if a person is normal or healthy weight, overweight, and obease. It is a widely used measure, as calucaltion is easy to do and requires only the inputof height and weight. It is calucalted as follows:'), p('Weight (kg) / [Height (m)]^2'), p('To find out more about BMI and how it is used please visit:  http://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html')),
            tabPanel("How to use",  p('In order to calculate your BMI, please input your Weight in kg and your Weight in meters using the up and down arrows or by typing in the input boxes in the first tab labeled Your BMI. When done press Submit. Your BMI will be displayed on the right hand side. Underneath the BMI value it will tell you weather your weight to height ratio is classified as underweight, normal weight or overweight'))
   
     ) ))))