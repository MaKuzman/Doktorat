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


### Extracting masked sequences from the genome
library(BSgenome.Esu.UCSC.EunSub1)
repeatsEsu <- getSeq(BSgenome.Esu.UCSC.EunSub1, allranges[width(allranges)>100])
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
kmersinsequences <- calculate_kmers(LTRSequences, normalize=T, reverse.complement=FALSE)
LTRs <- readRDS("repeatsEsuMetadata.RDS")
tsne <- get_tsne(kknew,LTRs, dims=2)
save(tsne, file="tsne.Robj")

tsne5000 <- get_tsne(kknew,LTRs, dims=2, per=5000)


