#!/bin/bash
#PBS -N bbdukdedup

#PBS -m bea
#PBS -M maja@kuzman.org

#PBS -q MASTER
#PBS -l select=1:ncpus=24:mem=200G

cd $PBS_O_WORKDIR

/common/WORK/mfabijanic/programs/bbmap/bbduk.sh in=Esu001gPrim_R1.fastq.gz in2=Esu001gPrim_R2.fastq.gz out=EsuTrimmed1.fq out2=EsuTrimmed2.fq outs=TrimmedSingletons.fq threads=24 qtrim=rl trimq=25 minlength=50 minavgquality=30 -Xmx180g ref=adapters.fa ktrim=l

# /common/WORK/mfabijanic/programs/bbmap/dedupe2.sh  in1=EsuTrimmed1.fq in2=EsuTrimmed2.fq out=EsuTrimmedDedup12.fq -Xmx200g threads=24 ac=f

# /common/WORK/mfabijanic/programs/bbmap/reformat.sh in=EsuTrimmedDedup12.fq out1=EsuTrimmedDedup1.fq out2=EsuTrimmedDedup2.fq
# /common/WORK/mfabijanic/programs/FastQC/fastqc -o EsuTrimmedDedupFastqc/ -t 24 EsuTrimmedDedup1.fq EsuTrimmedDedup2.fq
