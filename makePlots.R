
library(stringr)
library(magicaxis)

plothist <- function(h) {
  png(
    filename=paste("histogram_", str_pad(h, 3, "left", pad="0"), ".png",sep=""),
    width=12, 
    height=10, 
    units="cm",
    res=300
  )
    temp_margins<-par()$mar #copy margin properties
    temp_margins[3]<-1 # top margin = 1
    temp_margins[1]<-3.5 # bottom margin = 3
    par(mar=temp_margins)
  plot(
	cuda$ebin, 
	cuda[, 2+2*h], 
	type="S",
        xaxt="n",
        yaxt="n",
        ylab="",
        xlab=""
  )
  lines(
	cl$ebin, 
	cl[, 2+2*h], 
	type="S", 
	col="red",
        xaxt="n",
        yaxt="n",
        ylab="",
        xlab=""
  )
  magaxis(
        side=1:4, 
        labels=c(1,1,0,0), 
#        majorn=c(4, 4, 4, 4), 
        minorn=c(4, 4, 4, 4), # je 4 minor ticks zwischen major ticks
        xlab="bin",
        ylab="count",
        tcl=0.4
    )
  dev.off()
}

plotweight <- function(w) {
  png(

    filename=paste("weight_", str_pad(w, 3, "left", pad="0"), ".png",sep=""),
    width=12, 
    height=10, 
    units="cm",
    res=300
  )
    temp_margins<-par()$mar #copy margin properties
    temp_margins[3]<-1 # top margin = 1
    temp_margins[1]<-3.5 # bottom margin = 3
    par(mar=temp_margins)
  plot(
	cuda$ebin, 
	cuda[, 1+2*w], 
	type="S",
        xaxt="n",
        yaxt="n",
        ylab="",
        xlab=""
  )
  lines(
	cl$ebin, 
	cl[, 1+2*w], 
	type="S", 
	col="red",
        xaxt="n",
        yaxt="n",
        ylab="",
        xlab=""
  )
  magaxis(
        side=1:4, 
        labels=c(1,1,0,0), 
#        majorn=c(4, 4, 4, 4), 
        minorn=c(4, 4, 4, 4), # je 4 minor ticks zwischen major ticks
        xlab="bin",
        ylab="count",
        tcl=0.4
    )
  dev.off()
}

for (i in seq(80)) {
  plothist(i)
  plotweight(i)
}	
