#!/bin/bash
#PBS -N normalize

#PBS -m bea
#PBS -M maja@kuzman.org

#PBS -q MASTER

#PBS -l select=1:ncpus=24:mem=160G

cd $PBS_O_WORKDIR

IN1=EsuTrimmed1.fq
IN2=EsuTrimmed2.fq
OUT1=Mac1.fq
OUT2=Mac2.fq

/common/WORK/mfabijanic/programs/bbmap/bbnorm.sh -Xmx150g in=$IN1 in2=$IN2 out=$OUT1 out2=$OUT2 outt=$OUTT threads=22 hist=kmer_depth_hist_original.txt histout=kmer_depth_hist_normalised.txt ecc=t aec=t
