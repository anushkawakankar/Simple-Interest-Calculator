library(shiny)

shinyUI(fluidPage(
    titlePanel("Simple Interest Calculator"),
    sidebarLayout(
        sidebarPanel(
            helpText("This app calculates simple interest 
                     based on your inputs."),            
            br(),            
            numericInput("num_principal",
                         label = h6("Enter the principal amount (in $)"),
                         value = 1000),
            br(),            
            sliderInput("slider_intrate",
                        label = h6("Choose the yearly interest rate (in %)"),
                        min = 0, max = 20, value = 5),
            
            br(),            
            sliderInput("slider_num",
                        label = h6("Choose the number of time periods"),
                        min = 0, max = 50, value = 5),
            selectInput("select_time",
                        label = h6(""),
                        choices = list("Years" = 1,
                                       "Quarters" = 2,
                                       "Months" =3),
                        selected = 1 
            ), 
            br(),
            br(),            
            actionButton("action_Calc", label = "Refresh & Calculate")        
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Output",
                         p(h5("Your entered values:")),
                         textOutput("text_principal"),
                         textOutput("text_intrate"),
                         textOutput("text_num"),
                         textOutput("text_time"),
                         br(),
                         p(h5("Calculated values:")),
                         textOutput("text_int"),
                         textOutput("text_amt")
                ),
                tabPanel("Documentation",
                         p(h4("Simple Interest Calculator:")),
                         br(),
                         helpText("This application calculates simple interest
                             and total amount, i.e. principal plus interest."),
                         HTML("<u><b>Equation for calculation: </b></u>
                        <br> <br>
                        <b> A = P + I = P(1 + rt) ; R = r * 100 </b>
                        <br>
                        where: <br>
                        A = Total amount (Principal + Interest) <br>
                        P = Principal amount <br>
                        I = Interest amount <br>
                        r = Rate of interest per year, in decimal; r=R/100 <br>
                        t = Time period invested in years/quarters/months
                    ")                
                )
            )
        )
    )
))