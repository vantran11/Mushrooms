# server.R shiny mushrooms
suppressPackageStartupMessages(library(DT))
suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(googleVis))
suppressPackageStartupMessages(library(leaflet))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(htmltools))
suppressPackageStartupMessages(library(dplyr))

# mushroom <- read.csv("01_data/mushrooms.csv",stringsAsFactors = FALSE)
# mushrooms <- select(mushroom,class,capshape=cap.shape, capsurface=cap.surface,
#                     capcolor=cap.color, bruises, odor,population, habitat, 
#                     gillattachment=gill.attachment, gillspacing=gill.spacing, 
#                     gillsize=gill.size, gillcolor=gill.color, stalkshape=stalk.shape, 
#                     stalkroot=stalk.root, abovering=stalk.surface.above.ring, 
#                     belowring= stalk.surface.below.ring, veiltype=veil.type, 
#                     veilcolor=veil.color, ringnumber=ring.number, ringtype=ring.type, 
#                     sporecolor=spore.print.color,colorabovering=stalk.color.above.ring, colorbelowring=stalk.color.below.ring)


shinyServer(function(input, output, session) {
  
  # Maps on Charateristic tab ----------------------------------------------------
  
  # Show Characteristic graphs using ggplot2
  
  output$Color_plot <- renderPlot({
    dataset<- reactive({
         g <- ggplot(data = dataset(), aes(x=capcolor)) + geom_bar(aes(fill=class), position="dodge")
         g <- g + xlab ('Cap Color')
         g <- g + ylab ('Edible vs. Poisonous')
         g
    })
  })
         
  output$Odor_plot <- renderPlot({
    dataset<- reactive({
        g<-ggplot(data = dataset(), aes(x=odor)) + geom_bar(aes(fill=class), position="dodge")
        g <- g + xlab ('Odor')
        g <- g + ylab ('Edible vs. Poisonous')
        g
     
  })
})
  
  output$Gill_plot <- renderPlot({
    dataset<- reactive({
      g<-ggplot(data = dataset(), aes(x=gillcolor)) + geom_bar(aes(fill=class), position="dodge")
      g <- g + xlab ('Gill Color')
      g <- g + ylab ('Edible vs. Poisonous')
      g
      
    })
  })
  
  output$Spore_plot <- renderPlot({
    dataset<- reactive({
      g<-ggplot(data = dataset(), aes(x=sporecolor)) + geom_bar(aes(fill=class), position="dodge")
      g <- g + xlab ('Spore Print Color')
      g <- g + ylab ('Edible vs. Poisonous')
      g
      
    })
  })
  
  output$Pop_plot <- renderPlot({
    dataset<- reactive({
      g<-ggplot(data = dataset(), aes(x=population)) + geom_bar(aes(fill=class), position="dodge")
      g <- g + xlab ('Population of growth')
      g <- g + ylab ('Edible vs. Poisonous')
      g
      
    })
  })    
  
  # Habitat chart in floating panel of interactive map
  output$Hab_plot <- renderPlot({
    dataset<- reactive({
      g<-ggplot(data = dataset(), aes(x=habitat)) + geom_bar(aes(fill=class), position="dodge")
      g <- g + xlab ('Growing Habitat')
      g <- g + ylab ('Edible vs. Poisonous')
      g
      
    })
  })
  

 
  # Data table pages --------------------------------------------------------
  
  # show data using DataTable using googleVis               ??????????????????????????????????????????????????
  mushroom2 <- gvisTable(mush_data,formats=list(mush_data="class","Cap Color",
                                                "Odor","Gill Color","Spore Print Color",
                                                "Population","Habitat"),
                         options=list(page='enable'))
  plot(mushroom2) 
  
  ## show data table                                  Which one would work better, this method or googelVis??         
  #names(mushroom2) <- c('class','Cap Color','Odor','Gill Color','Spore Print Color','Population','Habitat')
  #output$table_mushroom2 <- DT::renderDataTable({
   # datatable(mushroom2, 
     #         rownames = FALSE) %>%
      #formatStyle(input$selected,
        #          background = "orange",
       #           fontWeight = 'bold')
  #})    
  
})





