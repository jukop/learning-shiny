library(shiny)
ui <- navbarPage(
  "SPSS-kurssi",   
  tabPanel("Harjoitus 1", "harj1"),
  tabPanel("Harjoitus 2", "harj2"),
  tabPanel("Harjoitus 3", "harj3"),
  tabPanel("Harjoitus 4 (koe 1)",
           textOutput("title"),
           textInput("name", "What's your name?", value="Firstname Lastname(s)"),
           textOutput("greeting"),
           textInput("student_number", "What's your Peppi student number? (usually 8 digits)"),
           span(textOutput("student_msg"), style="color:red"),
           textOutput("que1a"),
           numericInput(inputId="answer1a", label="Answer", value=0.000, min=-1000,max=1000,
                        step=0.001), #min, max, 
           span(textOutput("response"), style="color:red")
           ),
  tabPanel("Harjoitus 5", "harj5"),
  tabPanel("Harjoitus 6", "harj6"),
  tabPanel("Harjoitus 7", "harj7"),
  tabPanel("Harjoitus 8", "harj8"),
  tabPanel("Harjoitus 9", "harj9"),
  tabPanel("Harjoitus 10 (koe 2)", "harj10koe"),
  # navbarMenu("subpanels", 
  #            tabPanel("panel 4a", "four-a"),
  #            tabPanel("panel 4b", "four-b"),
  #            tabPanel("panel 4c", "four-c")
  #)
)


server <- function(input, output, session) {
  output$title <- renderText({"SPSS course for UEF: development version 0.001"})
  output$greeting <- renderText({
    if(input$name!="") {
      paste0("Hello ", input$name)
    }
  })
  output$student_msg <- renderText({
    if (stringr::str_detect(string=input$student_number,pattern="^\\d{7,8}$")) {
      "Thank you."
    } else if (stringr::str_detect(string=input$student_number,pattern="^\\d{6}$")) {
      "It looks like you have entered Weboodi style student number. Give Peppi student number instead."
    } else if (stringr::str_detect(string=input$student_number,pattern="^\\d{9}+$")) {
      "Student number is too long."
    } else {
      ""
    }
  })
  output$que1a <- renderText({"How much is 1.03 to the power of 3 ?"})
  output$response <- renderText({
    if (round(input$answer1a,3)==round(1.03^3,3)) {
      paste0("It is correct.")
    } else if (round(input$answer1a,2)==round(1.03^3,2)) {
      paste0("Almost! Check rounding.")
    } else {
      paste0("Incorrect.")
    }
  })
}
shinyApp(ui, server)
