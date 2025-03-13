#!/bin/bash -ue
fastp \
-i DRR187559_1.fastq.gz -I DRR187559_2.fastq.gz -o DRR187559.cleaned.R1.fastq.gz -O DRR187559.cleaned.R2.fastq.gz \
--json DRR187559.fastp.json \
--html DRR187559.fastp.html \
 --thread 3 --detect_adapter_for_pe \
 --qualified_quality_phred 20 \
 --cut_right  --length_required 50
