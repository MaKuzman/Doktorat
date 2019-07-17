#!/bin/bash
#PBS -N busco

#PBS -m ea
#PBS -M maja@kuzman.org

#PBS -q MASTER
#PBS -l select=1:ncpus=12:mem=80G

cd $PBS_O_WORKDIR
BUSCO_FOLDER=/common/WORK/mfabijanic/programs/busco/
$BUSCO_FOLDER/scripts/run_BUSCO.py -i ../$i -o ${i%%.*} -m geno -l $BUSCO_FOLDER/metazoa_odb9 -c 10 -sp amphimedon -t . --long 
