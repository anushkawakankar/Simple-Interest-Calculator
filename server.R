library(shiny)
library(car)    # Import library to use recode() function

shinyServer(function(input, output) {
    
    values <- reactiveValues()
    # Calculate the interest and amount    
    observe({
        input$action_Calc
        values$int <- isolate({
            input$num_principal * input$slider_intrate *
                recode(input$select_time, "1 = '1'; 2 = '0.25'; 
                                   3 = '0.08333333'")/100 * input$slider_num  
        })
        values$amt <- isolate(input$num_principal) + values$int
    })
    
    # Display values entered
    output$text_principal <- renderText({
        input$action_Calc
        paste("Principal amount: [$]", isolate(input$num_principal))
    })
    
    output$text_intrate <- renderText({
        input$action_Calc
        paste("Interest rate: ", isolate(input$slider_intrate), 
              " % per year")
    })
    
    output$text_num <- renderText({
        input$action_Calc
        paste("Time period ", isolate(input$slider_num),
              recode(isolate(input$select_time),
                     "1 = 'Years'; 2 = 'Quarters';3 = 'Months'")
        )
    })
    
    # Display calculated values
    
    output$text_int <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Simple Interest [$]:", values$int)
    })
    
    output$text_amt <- renderText({
        if(input$action_Calc == 0) ""
        else 
            paste("Total Amount, i.e. Principal plus Interest [$]:", values$amt)
    })
    
})