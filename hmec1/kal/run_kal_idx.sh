#!/bin/bash
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_31/gencode.v31.transcripts.fa.gz
kallisto index -i gencode.v31.transcripts.fa.gz.idx gencode.v31.transcripts.fa.gz

