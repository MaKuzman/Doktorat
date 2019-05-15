setwd("/common/WORK/mfabijanic/Sponges/Annotation/WindowMask")
library(GenomicRanges)
### Reading in positions masked in genome:

ff <- readLines("EsuV5.2.masked.fasta")
ps<-paste(ff, collapse=":")
x <- strsplit(strsplit(ps,">")[[1]][-1],":")
allranges <- sapply(x[sapply(x, length)>1], function(y){

  se <- sapply(strsplit(y[-1]," - "), as.numeric)
  sstarts <- se[1,]+1
  sends <- se[2,]
  GRanges(y[1],IRanges(sstarts, sends))
})
allranges <- suppressWarnings(do.call(c,allranges))
allranges <- allranges[width(allranges)>100]

### Extracting masked sequences from the genome
library(BSgenome.Esu.UCSC.EunSub1)
repeatsEsu <- getSeq(BSgenome.Esu.UCSC.EunSub1, allranges)
LTRs <- data.frame(widths = width(LTRSequences),
                   chr = seqnames(allranges),
                   start = start(allranges),
                   end = end(allranges),
                   nms = paste(paste(seqnames(allranges), start(allranges), sep=":"),end(allranges), sep="-")
                  )
saveRDS(LTRs, file="repeatsEsuMetadata.RDS")

### tSNE
source("/common/WORK/mfabijanic/Svoboda/April2019/LTRs/Sequence_TSNE.R")
LTRSequences <- readRDS("repeatsEsu.RDS")
LTRs <- readRDS("repeatsEsuMetadata.RDS")

kmersinsequences <- calculate_kmers(LTRSequences, normalize=T, reverse.complement=FALSE)
kknew <- kmersinsequences[,order(apply(kmersinsequences,2,sd),decreasing=T)[1:50]]
tsne <- get_tsne(kknew,LTRs, dims=2, per=1000)
saveRDS(tsne, file="tsne1000.RDS")
tsne2500 <- get_tsne(kknew,LTRs, dims=2, per=2500)
saveRDS(tsne2500, file="tsne2500.RDS")

kknew <- kmersinsequences[,order(apply(kmersinsequences,2,sd),decreasing=T)[1:1000]]
tsne <- get_tsne(kknew,LTRs, dims=2, per=1000)
saveRDS(tsne, file="tsne1000_first1000.RDS")


### Plotting:
#(same for all tsne objects)
ggplot(tsne2500, aes(X1,X2)+geom_point()+theme_light()
