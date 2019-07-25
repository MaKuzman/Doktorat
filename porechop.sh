#!/bin/bash
#PBS -N porechopfail

#PBS -m bea
#PBS -M maja@kuzman.org

#PBS -q MASTER
#PBS -l select=1:ncpus=12:mem=100G

cd $PBS_O_WORKDIR

PORECHOP=/common/WORK/mfabijanic/programs/Porechop/porechop-runner.py
wget https://raw.githubusercontent.com/MaKuzman/Doktorat/master/porechopOne.sh

for i in `ls /common/scratch/kristian/Nanopore_basecall/LSK108/workspace/fail/`
do

j=${i%%.fastq}
k=${j##fastq_runid_}
qsub -v i=$k -N ${k} porechopOne.sh
done

