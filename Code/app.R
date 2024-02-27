# "You can use the source function in R to reuse functions that you create in another R script."
# It allows us to write function in separate files and then call them in others.
setwd('L:/Shiny Practice/Fun Project/Code')
source("global.R", local = TRUE)
source("ui.R", local = TRUE)
source("server.R", local = TRUE)



shinyApp(ui = ui, server = server)
