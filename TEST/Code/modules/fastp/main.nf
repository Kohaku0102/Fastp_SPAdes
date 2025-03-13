
process fastp {
tag "$sampleid"



conda "bioconda::fastp=0.24.0"
container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
'https://depot.galaxyproject.org/singularity/fastp:0.24.0--heae3180_1' :
'quay.io/biocontainers/fastp:0.24.0--heae3180_1' }"

input:
tuple val(sampleid), path(reads)

output:
tuple val(sampleid), path("*.json")
tuple val(sampleid), path("*.html")
tuple val(sampleid), path("*.cleaned.R1.fastq.gz"),path("*.cleaned.R2.fastq.gz"),emit: cleaned_reads




script:
"""

fastp \\
-i ${reads[0]} -I ${reads[1]} -o ${sampleid}.cleaned.R1.fastq.gz -O ${sampleid}.cleaned.R2.fastq.gz \\
--json ${sampleid}.fastp.json \\
--html ${sampleid}.fastp.html \\
 --thread 3 --detect_adapter_for_pe \\
 --qualified_quality_phred 20 \\
 --cut_right \
 --length_required 50
"""



}