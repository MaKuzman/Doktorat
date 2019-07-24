#!/bin/bash
#PBS -N lordec

#PBS -m bea
#PBS -M maja@kuzman.org

#PBS -q MASTER
#PBS -l select=1:ncpus=24:mem=400G

cd $PBS_O_WORKDIR

LORDEC=/common/WORK/dglavas/programs/LoRDEC-0.5.3-Linux/bin/lordec-correct

IN1=/common/WORK/mfabijanic/Sponges/Assembly/Eunapius/Illumina/qualityFiltering/Mac1.fq
IN2=/common/WORK/mfabijanic/Sponges/Assembly/Eunapius/Illumina/qualityFiltering/Mac2.fq

$LORDEC -k 21 -s 3 -T 22 -2 $IN1 $IN2 -i $NANOIN -o $NANOOUT -S ${NANOOUT}_stats.txt -a 100000
