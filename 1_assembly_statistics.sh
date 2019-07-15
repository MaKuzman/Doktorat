## Genome statistics   



The genomes are located in the folder:
```
/common/WORK/mfabijanic/Sponges/CURRENT/GENOMES
```

### quast
I am generating the quast report for all the genomes:
```
QUAST=/common/WORK/mfabijanic/programs/quast-5.0.2/quast.py
$QUAST *fasta
```
### BUSCO

I am calculating BUSCO completeness for all the genomes:

```
BUSCO_FOLDER=/common/WORK/mfabijanic/programs/busco/

for i in `ls *fasta`; do 
cd ${i%%.*}
$BUSCO_FOLDER/scripts/run_BUSCO.py -i ../$i -o ${i%%.*}_busco -m geno -l $BUSCO_FOLDER/metazoa_odb9 -c 4 -sp amphimedon -t . 
cd ..
done


```
