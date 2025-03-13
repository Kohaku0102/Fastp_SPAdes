include {SPAdes} from '/home/kohaku/TEST/modules/nf_core/SPAdes/main.nf'
params.reads = "/home/kohaku/TEST/subworkflows/Result/*.cleaned.{R1,R2}.fastq.gz"
ch_reads = Channel.fromFilePairs(params.reads, flat: true)
ch_reads.view()
workflow SPAdes_denovo {
take: 
 reads

main:
SPAdes(reads)



}
workflow {SPAdes_denovo(ch_reads)}