library(shiny)
setwd("~/REPO/crm-analitico/Configuratore")
source("ScriptClass.R")
load("BundleDett.Rdata")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  

  output$idCliente <- renderText(
{
 
paste("ciao, hai inserito l'idCliente:",input$idCliente)
  
}
)
output$prova <-{reactive(
  
  htmlpage1.PI(PI_constructor(input$idCliente,BundleDett=BundleDett))
)
        

 
  }

})
 
  


