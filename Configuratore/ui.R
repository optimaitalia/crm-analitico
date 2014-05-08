
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
         tabPanel("Eliminazione servizi-utenze",h4("Eliminazione servizi-utenze")),
         tabPanel("Aggiunta servizi-utenze",h4("Aggiunta servizi-utenze")),
         tabPanel("Modifica configurazione PI",h4("Modifica configurazione")),      
        tabPanel("Modifica canone"))
                
      )
               )
         )
  
  
   )
  

    

  
