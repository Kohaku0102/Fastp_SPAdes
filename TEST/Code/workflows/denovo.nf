include { fastp } from '/home/kohaku/TEST/Code/modules/fastp/main.nf'
include { SPAdes } from '/home/kohaku/TEST/Code/modules/SPAdes/main.nf'


workflow cleaned_denovo {
take:
ch_reads

main:
ch_cleaned = fastp(ch_reads).cleaned_reads
SPAdes(ch_cleaned)

emit:
result = SPAdes.out.All_file




}