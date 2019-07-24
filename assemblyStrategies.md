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

Second strategy is to use Jabba for hybrid error correction, based on this paper: https://genomebiology.biomedcentral.com/articles/10.1186/s13059-018-1605-z#MOESM5 ; Jabba
Karect (version 1.0) was used to correct errors in SRs for small datasets with parameters set as suggested, but not applied to large datasets given memory limitation. Brownie (version 1.0) was used to build de Bruijn graph, followed by Jabba for LR error correction,
both with k=71. Jabba uses short reads which need to be error corrected by karect. So the first step here is to error correct **trimmed** (not normalized) Illumina reads:

```
cd /common/WORK/mfabijanic/Sponges/Assembly/Eunapius/Illumina/karect
qsub karect.sh

#### This is the script:
## #PBS -l select=1:ncpus=12:mem=600G

## cd /common/WORK/mfabijanic/Sponges/Assembly/Eunapius/Illumina/karect
## KARECT=/common/WORK/mfabijanic/programs/karect/karect
## $KARECT  -correct -matchtype=hamming -celltype=diploid -inputfile=../Eunapius_Illumina_Trimmed_1.fq -inputfile=../Eunapius_Illumina_Trimmed_2.fq

```
After this, I will use brownie to build de Brujin graph:

### Jabba and karect take way too long so I quit this strategy. karect died because of memory issues! 



