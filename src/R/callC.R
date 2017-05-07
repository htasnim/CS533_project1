library(stringr)

doGraphs = FALSE
compileGreedy = FALSE
compileRandom = FALSE
doColor = TRUE

if(compileGreedy){
  system('clang greedy.c')
  system('mv a.out greedyColor')
}

if(compileRandom){
  system('clang random.c')
  system('mv a.out randomColor')
}

if(doGraphs){
  for(n in 2^(0:7)){
  maxM = ((n * (n - 1)) / 2)
    for(m in 2^(0:12)){
      if(m <= maxM){
        for(s in 1:100){
          rgString = paste0('./randGraph ',n, ' ', m, ' ', s, ' > rGraphs/n',n,'m',m,'s',s,'.txt')
          system(rgString)
        }
      }
    }
  }
}

if(doColor){

  gTime = matrix(nrow = 12, ncol = 7)
  gColors  = matrix(nrow = 12, ncol = 7)
  rTime = matrix(nrow = 12, ncol = 7)
  rColors  = matrix(nrow = 12, ncol = 7)
  
  for(ni in 1:7){
    n = 2^(ni-1)
    maxM = ((n * (n - 1)) / 2)
    for(mi in 1:12){
      m = 2^(mi-1)
      if(m <= maxM){
        nmgRuntimes = numeric()
        nmgColors = numeric()
        nmrRuntimes = numeric()
        nmrColors = numeric()
        for(s in 1:100){
          gString = paste0('./greedyColor rGraphs/n',n,'m',m,'s',s,'.txt')
          rString = paste0('./randomColor rGraphs/n',n,'m',m,'s',s,'.txt ', 1,' ', s)
          
          #rString = paste0('./randomColor rGraphs/n',n,'m',m,'s',s,'.txt ', 2,' ', s)
          #gString = paste0('./randomColor rGraphs/n',n,'m',m,'s',s,'.txt ', 4,' ', s)
          
          g = system(gString, intern = T)
          for(z in 1:length(g)){
            outStr = str_split(g[z], ':')[[1]]
            if(outStr[1] == 'maxColor'){
              nmgColors = c(nmgColors, outStr[2])
            }
            else if(outStr[1] == 'time'){
              nmgRuntimes = c(nmgRuntimes, outStr[2]) 
              
            }
          }
          
          r = system(rString, intern = T)
          for(z in 1:length(r)){
            outStr = str_split(r[z], ':')[[1]]
            if(outStr[1] == 'maxColor'){
              nmrColors = c(nmrColors, outStr[2])
            }
            else if(outStr[1] == 'time'){
              nmrRuntimes = c(nmrRuntimes, outStr[2]) 
            }
          }
        }
        gTime[mi,ni] = mean(as.numeric(nmgRuntimes), na.rm = T)
        gColors[mi,ni]  = mean(as.numeric(nmgColors), na.rm = T)
        rTime[mi,ni] = mean(as.numeric(nmrRuntimes), na.rm = T)
        rColors[mi,ni]  = mean(as.numeric(nmrColors), na.rm = T)
      }
    }
  }
}

# uh, this is terrible, oh well. 
# 
# 
# rand2Colors = rColors
# rand2Time = rTime
# rand4Colors = gColors
# rand4Time = gTime
rand8Colors = rColors
rand8Time = rTime
rand16Colors = gColors
rand16Time = gTime
# 
# save(greedyColors, file = 'greedyColors.RData')
# save(greedyTime, file = 'greedyTimes.RData')
# 
# save(rand1Colors, file = 'rand1Colors.RData')
# save(rand1Time, file = 'rand1Times.RData')
# 
# save(rand2Colors, file = 'rand2Colors.RData')
# save(rand2Time, file = 'rand2Times.RData')
# 
# save(rand4Colors, file = 'rand4Colors.RData')
# save(rand4Time, file = 'rand4Times.RData')
# 
# save(rand8Colors, file = 'rand8Colors.RData')
# save(rand8Time, file = 'rand8Times.RData')
# 
# save(rand16Colors, file = 'rand16Colors.RData')
# save(rand16Time, file = 'rand16Times.RData')