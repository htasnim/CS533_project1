#heatmaps
nmHeatmap = function(data, plotTitle, cscale){
  
  a = melt(data)
  speCols = colorRampPalette(rev(brewer.pal(11, 'Spectral')), space = 'Lab')
  zg = ggplot(a, aes(x = Var2, y = Var1, fill = value)) + 
       geom_tile(color = "white", size = 0.1) + 
       geom_text(aes(label = round(value, 1)), na.rm = T) +
       scale_fill_gradientn(colours = speCols(100),limits = cscale) +  
       coord_equal() + 
       scale_x_discrete(expand = c(0,0), limits = c('1',"2","4","8","16","32","64"),position = "bottom")+
       scale_y_discrete(expand = c(0,0), limits = c('1',"2","4","8","16","32","64", "128", "256", "512", "1024", "2048"),position = "left")+
       theme(plot.title=element_text(hjust=0))+
       theme(axis.ticks = element_blank())+
       theme(axis.text = element_text(size = 70)) +
       theme_tufte(base_family = "Helvetica") +
       labs(x="Nodes (n)", y="Edges (m)", title = plotTitle) 
  
  zg
}

#CONVERT TO MICROSECONDS
if(max(greedyTime, na.rm = T) < 0.5){
  greedyTime = greedyTime * 1000000
  rand1Time = rand1Time * 1000000
  rand2Time = rand2Time * 1000000
  rand4Time = rand4Time * 1000000
}

maxColors = max(c(max(greedyColors, na.rm=T), max(rand1Colors, na.rm=T), 
                  max(rand2Colors, na.rm=T),  max(rand4Colors, na.rm=T)))

minColors = min(c(min(greedyColors, na.rm=T), min(rand1Colors, na.rm=T),
                  min(rand2Colors, na.rm=T), min(rand4Colors, na.rm=T)))

gc = nmHeatmap(data = greedyColors, plotTitle = "Greedy", cscale = c(minColors,maxColors)) + labs(fill="#Colors")
r1c = nmHeatmap(data = rand1Colors, plotTitle = "Random (i = 1)", cscale = c(minColors,maxColors))+ labs(fill="#Colors")
r2c = nmHeatmap(data = rand2Colors, plotTitle = "Random (i = 2)", cscale = c(minColors,maxColors))+ labs(fill="#Colors")
r4c = nmHeatmap(data = rand4Colors, plotTitle = "Random (i = 4)", cscale = c(minColors,maxColors))+ labs(fill="#Colors")

png("colorHeatmaps.png", width = 900, height = 1440, pointsize = 10)
grid_arrange_shared_legend(gc,r1c,r2c,r4c, ncol = 2, nrow = 2, position = 'right')
graphics.off()



maxTime = max(c(max(greedyTime, na.rm=T), max(rand1Time, na.rm=T),
                max(rand2Time, na.rm=T), max(rand4Time, na.rm=T)))

minTime = min(c(min(greedyTime, na.rm=T), min(rand1Time, na.rm=T), 
                min(rand2Time, na.rm=T), min(rand4Time, na.rm=T)))

gt = nmHeatmap(data = greedyTime, plotTitle = "Greedy", cscale = c(minTime, maxTime)) + labs(fill="μs")
r1t = nmHeatmap(data = rand1Time, plotTitle = "Random (i = 1)", cscale = c(minTime, maxTime)) + labs(fill="μs")
r2t = nmHeatmap(data = rand2Time, plotTitle = "Random (i = 2)", cscale = c(minTime, maxTime)) + labs(fill="μs")
r4t = nmHeatmap(data = rand4Time, plotTitle = "Random (i = 4)", cscale = c(minTime, maxTime)) + labs(fill="μs")

png("timeHeatmaps.png", width = 900, height = 1440, pointsize = 10)
grid_arrange_shared_legend(gt,r1t,r2t,r4t, ncol = 2, nrow = 2, position = 'right')
graphics.off()



