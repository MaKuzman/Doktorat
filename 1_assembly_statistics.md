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

I am calculating BUSCO long completeness for all the genomes:

```

for i in `ls *fasta`
do 
cd ${i%%.*}
wget -O - https://raw.githubusercontent.com/MaKuzman/Doktorat/master/buscoLong.sh | qsub -v i=$i ; 
cd ..
done


```

Generating busco plot:

```
cd /common/WORK/mfabijanic/Sponges/CURRENT/GENOMES/Statistics/busco
mv ../*/run_*[^{busco}]/short* .
wget -O busco_figure.R  https://raw.githubusercontent.com/MaKuzman/Doktorat/master/busco_figure.R ; Rscript busco_figure.R
```

