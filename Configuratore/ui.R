
source("ScriptClass.R")
source("HtmlMethodPannelloidCliente.R")
source("method.R")
shinyUI(
  ##inizio app shiny.
  
  fluidPage(
  ##inizio pagina
    titlePanel("Configuratore"),
  
  ##titolo pagina
    sidebarLayout( 
  ###pannello laterale layout
        sidebarPanel( textInput(inputId="idCliente",label="Inserisci idcliente",value=""),
                      textOutput("idCliente"),
                      br(),
                     tableOutput("prova")
      ##contenuti pannello laterale
         
                    ),
      ###text widget
                       
      mainPanel( tabsetPanel(
        tabPanel("Eliminazione servizi-utenze",h4("Eliminazione servizi-utenze"),
                 conditionalPanel(
                   condition="input.bivariate==true",
                   selectInput(inputId = "variable2", 
                               label = "Select Second Variable:",
                               choices = c("Binary Variable 1" = "binary1",
                                           "Binary Variable 2" = "binary2", 
                                           "Continuous Variable 1" = "cont1",
                                           "Continuous Variable 2" = "cont2"),
                               selected = "Binary Variable 2"
                   )
             
                     
                 
                 
                 ),
        tabPanel("Aggiunta servizi-utenze",h4("Aggiunta servizi-utenze")),
        tabPanel("Modifica configurazione PI",h4("Modifica configurazione")),
                
        tabPanel("Modifica canone"))
                
      
               )
         )
  
  
)
  
)
  
    

  
