library(data.table)
library(stringr)

setwd("/common/WORK/mfabijanic/Sponges/Annotation/LTRPred")

amp  <- fread('cat Amphimedon_queenslandica_ltrpred/Amphimedon_queenslandica_LTRpred.gff | awk \'{gsub (/ |\t/,"|"); print}\' ')
emu <- fread('cat Emu_Illumina_out_ltrpred/Emu_Illumina_out_LTRpred.gff | awk \'{gsub (/ |\t/,"|"); print}\' ')
esu <- fread('cat EsuV5_ltrpred/EsuV5_LTRpred.gff | awk \'{gsub (/ |\t/,"|"); print}\' ')
subb <- fread('cat Sub_v0_ltrpred_1/Sub_v0_LTRpred.gff | awk \'{gsub (/ |\t/,"|"); print}\' ')

makenamesbetter <- function(emu){
  nms <- colnames(emu)[10:41]
  nn=emu[,(str_extract(.SD[1],".+(?==)")),.SDcols=nms]
  emu[,(nn):=(lapply(.SD, function(x) str_extract(str_extract(x,"(?<==).+") ,".+(?=;)" ))),.SDcols=nms]
  emu[,(nms):=NULL]
}
sapply(list(emu, esu, amp, subb),makenamesbetter)
