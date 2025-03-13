include {fastp} from '/home/kohaku/TEST/modules/nf_core/fastp/main.nf'
params.reads = "/home/kohaku/bioinformatics/data/*_{1,2}.fastq.gz"
ch_reads = Channel.fromFilePairs(params.reads)
ch_reads.view()

workflow fastp_cleaned {
take: 
ch_reads

main:
fastp(ch_reads)



}
workflow {fastp_cleaned(ch_reads)}