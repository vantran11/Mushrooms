#global.R Mushrooms

library(data.table)

# Mushroom data
mushroom <- read.csv("mushrooms.csv",stringsAsFactors = FALSE)
mushrooms <- select(mushroom,class,capshape=cap.shape, capsurface=cap.surface,
                    capcolor=cap.color, bruises, odor,population, habitat, 
                    gillattachment=gill.attachment, gillspacing=gill.spacing, 
                    gillsize=gill.size, gillcolor=gill.color, stalkshape=stalk.shape, 
                    stalkroot=stalk.root, abovering=stalk.surface.above.ring, 
                    belowring= stalk.surface.below.ring, veiltype=veil.type, 
                    veilcolor=veil.color, ringnumber=ring.number, ringtype=ring.type, 
                    sporecolor=spore.print.color,colorabovering=stalk.color.above.ring, colorbelowring=stalk.color.below.ring)

## filtered for mush_data 
mush_data<- select= c(mushroom,class,capcolor=cap.color, odor,population, habitat, gillcolor=gill.color,sporecolor=spore.print.color)


