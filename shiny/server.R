BMI <- function(Weight,Height) Weight / Height^2
BMIclass <- function(x) {if (18.5 <= x & x <= 24){ print("normal weight")}
                         else
                         {if (x<18.5) {print("underweight")}
                          else{print("overweight")}
                         }}
shinyServer( 
 
    function(input, output) {
    output$text1 <- renderPrint({BMI(input$Weight, input$Height)})
    output$text2 <- renderPrint({BMIclass(BMI(input$Weight, input$Height))})
} )