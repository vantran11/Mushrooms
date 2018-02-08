## ui.R Mushrooms
library(shinydashboard)

suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(shinydashboard))


# mushroom <- read.csv("01_data/mushrooms.csv",stringsAsFactors = FALSE)
# mushrooms <- select(mushroom,class,capshape=cap.shape, capsurface=cap.surface,
#                     capcolor=cap.color, bruises, odor,population, habitat, 
#                     gillattachment=gill.attachment, gillspacing=gill.spacing, 
#                     gillsize=gill.size, gillcolor=gill.color, stalkshape=stalk.shape, 
#                     stalkroot=stalk.root, abovering=stalk.surface.above.ring, 
#                     belowring= stalk.surface.below.ring, veiltype=veil.type, 
#                     veilcolor=veil.color, ringnumber=ring.number, ringtype=ring.type, 
#                     sporecolor=spore.print.color,colorabovering=stalk.color.above.ring, colorbelowring=stalk.color.below.ring)


shinyUI(dashboardPage(
  skin = 'red',
  dashboardHeader(title = "Mushrooms"), # Create header top left
  
  
  # Create sidebar ----------------------------------------------------------
  
  dashboardSidebar(
    sidebarMenu( # Create menu on left side
      menuItem(
        "All about mushrooms",
        tabName = "intro",
        icon = icon("comment")
      ),
      menuItem(
        "Characteristics of the most 
        indicative of poisonous",
        tabName = "characteristic",
        icon = icon("graph")
  
      ),
      menuItem("Mushroom Data", tabName = "mush_data", icon = icon("database"))
      )
),

  
  
  # Create tab bodies -------------------------------------------------------
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "intro", # Create intro tab
              div(id = 'intro',
                  tags$head(# Include custom CSS
                    includeCSS("02_scripts/styles_drs.css")),
                  fluidRow(column(
                    4,
                    h1('Mushroom Hunting'),
                    h4('Are you an adventurous person?'),
                    h4(
                      'Are you willing to eat something outside of your confort zone?'
                    ),
                    h4(
                      'Have you ever tastes wild mushroom?'
                    ),
                    h4(
                      'Mushroom hunting is very popular all over the world.  Mushroom hunting season begin in the early spring and lasted until late fall.  Each season brings its own group of varieties.  Whether they may be edible or poisonous, each mushroom has its own special characteristic that sometimes can really confuse the hunters'
                    ),
                    h4(
                      'So if you are a new hunter, how could you tell the difference between the edible type vs the poisonous? '
                    ),
                    h4(
                      'Do you trust your senses enough to eat what you pick?'
                    ),
                    h4('What if there is an app that can help to indicate the special features that can help your hunting season a safe hunting season?

                       '),
                    p(
                      'Mushroom records drawn from The Audubon Society Field Guide to North American Mushrooms (1981). G. H. Lincoff (Pres.), New York: Alfred A. Knopf '
                    )
                  )))), 
      
      tabItem(tabName = "characteristic", # Create tab with characteristics graphs(cap.color,odor, gill.color,spore.print.color, habitat, population)
              
              fluidRow(column(
                6,
                div(
                  align = 'center',
                  h4('Cap Color'),
                  box(htmlOutput("color"), width = 12)
                ),
                box(
                  p(
                    'This graph shows that most poisonous mushrooms have these common 4 colors : red, gray, brown, and yellow'
                  ),
                  width = 12
                )
              ),
              
              column(
                6,
                div(
                  align = 'center',
                  h4('Odor'),
                  box(htmlOutput("odor"), width = 12)
                ),
                box(
                  p(
                    'This graph shows that most edible mushroom have no odor.  Any scent of odor, especially foul, spicy, or fishy indicate that the mushroom is poisonous '
                  ),
                  width = 12
                ),
                column(
                  6,
                  div(
                    align = 'center',
                    h4('Gill Color'),
                    box(htmlOutput("gill"), width = 12)
                  ),
                  box(
                    p(
                      'According to this graph, the majority of the mushroom with gill color of buff, chocolate, and gray are poisonous.'
                    ),
                    width = 12
                  )
                ),
                
                column(
                  6,
                  div(
                    align = 'center',
                    h4('Spore Print Color'),
                    box(htmlOutput("spore"), width = 12)
                  ),
                  box(
                    p(
                      ' This graph shows that mushrooms with spore print color of white or chocolate are mostly poisonous.'
                    ),
                    width = 12
                  )
              ))), 
 
  # Characteristic data-----------------------------------------------------------------------------    
      tabItem(tabName = "mushroom2",
              fluidRow(box(DT::dataTableOutput("table_acc"), width = 12))
      )
    ))
  )
))