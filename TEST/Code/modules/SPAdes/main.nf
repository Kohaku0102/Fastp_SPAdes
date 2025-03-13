

process SPAdes { 

tag "$sampleid"



conda "bioconda::spades=4.1.0"
container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
'ttps://depot.galaxyproject.org/singularity/spades:4.0.0--h5fb382e_1' :
'biocontainers/spades:4.0.0--h5fb382e_1' }"


input:
tuple val(sampleid), path(cleaned_R1), path(cleaned_R2)


output:
path"*",emit: All_file


script: 
"""
spades.py -1 ${cleaned_R1} -2 ${cleaned_R2} -o Result_${sampleid} --only-assembler
"""
}

