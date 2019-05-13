setwd("/common/WORK/mfabijanic/Sponges/Annotation/WindowMask")
ff <- readLines("EsuV5.2.masked.fasta")
ps<-paste(ff, collapse=":")
x <- strsplit(strsplit(ps,">")[[1]][-1],":")
allranges <- sapply(x, function(y){

  se <- sapply(strsplit(y[-1]," - "), as.numeric)
  sstarts <- se[1,]+1
  sends <- se[2,]
  GRanges(y[1],IRanges(sstarts, sends))
})
allranges <- suppressWarnings(do.call(c,allranges))

