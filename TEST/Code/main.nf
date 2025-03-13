nextflow.enable.dsl=2

params.reads = "/home/kohaku/bioinformatics/data/*_{1,2}.fastq.gz"
ch_reads = Channel.fromFilePairs(params.reads)
ch_reads.view()


include {cleaned_denovo} from "/home/kohaku/TEST/Code/workflows/denovo.nf"

workflow de_novo {
take: 
ch_reads

main:
cleaned_denovo(ch_reads)
}



workflow {de_novo(ch_reads)}