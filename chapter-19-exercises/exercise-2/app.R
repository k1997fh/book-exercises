# Exercise 2: a basic Shiny app

# Load the `shiny` package
library("shiny")

# Define a new `ui` variable. This variable should be assigned a `fluidPage()` layout
# The `fluidPage()` layout should be passed the following:
ui <- fluidPage(
  titlePanel("Cost Calculator"), 
  numericInput("price", "Price (in dollars): ", 0, min = 0), 
  numericInput("quant", "Quantity: ". 1, min = 1), 
  h1("Cost"), 
  textOutput("cost", "cost")
)
  
  # A `titlePanel()` layout with the text "Cost Calculator"

  
  # A `numericInput()` widget with the label "Price (in dollars)"
  # It should have a default value of 0 and a minimum value of 0
  # Hint: look up the function's arguments in the documentation!

  
  # A second `numericInput()` widget with the label "Quantity"
  # It should have a default value of 1 and a minimum value of 1  

  
  # The word "Cost", strongly bolded

  
  # A `textOutput()` output of a calculated value labeled `cost`



# Define a `server` function (with appropriate arguments)
# This function should perform the following:
server <- function(input_list, output_list)  {
  output_list$cost <- renderText()
  
}
  
  # Assign a reactive `renderText()` function to the output's `cost` value
  # The reactive expression should return the input `price` times the `quantity`
  # So it looks nice, paste a "$" in front of it!



# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)
