#!/bin/bash
#PBS -N porechop

#PBS -m bea
#PBS -M maja@kuzman.org

#PBS -q MASTER
#PBS -l select=1:ncpus=12:mem=100G

cd $PBS_O_WORKDIR

PORECHOP=/common/WORK/mfabijanic/programs/Porechop/porechop-runner.py

echo $i
$PORECHOP -t 10 -i /common/scratch/kristian/Nanopore_basecall/LSK108/workspace/fail/fastq_runid_${i}.fastq --adapter_threshold 85.0 > ${i}.fastq

