## canu 

The first strategy is to use canu for error correction , and then use wtdbg2 or canu to assemble the corrected nanopore reads, scaffold with npscarf and illumina contigs and see the BUSCO completeness and quast results.

Canu correction:

```
qsub -I -l select=1:ncpus=48:mem=600G -N canu
 export PATH=/usr/bin/:$PATH

canu -correct genomeSize=350m -nanopore-raw ../Nanopore/Eunapius_Nanopore.fastq useGrid=false -p ESUNANO -d ESUNANO maxThreads=48 maxMemory=600

```

#### canu (correct) -> wtdbg2 -> npScarf (SPAdes contigs) -> BUSCO+quast:


#### canu (correct) -> canu (trim-assemble) -> npScarf (SPAdes contigs) -> BUSCO+quast:



## Jabba 

Second strategy is to use Jabba for hybrid error correction, based on this paper: https://genomebiology.biomedcentral.com/articles/10.1186/s13059-018-1605-z#MOESM5 




