#!/bin/bash -ue
fastp \
-i Input -I null -o Input.cleaned.R1.fastq.gz -O Input.cleaned.R2.fastq.gz \
--json Input.fastp.json \
--html Input.fastp.html \
 --thread 3 --detect_adapter_for_pe \
 --qualified_quality_phred 20 \
 --cut_right  --length_required 50
