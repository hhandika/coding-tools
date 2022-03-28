#!/usr/bin/env bash

OUTPUT_DIR="snp-sites-output"


for i in SEGUL-Convert/*.fas; do
    fname="$(basename $i)"
    echo "Processing $fname"
    snp-sites $i -o $fname -p -v
done


if [ -d $OUTPUT_DIR ]
then
rm -r $OUTPUT_DIR
fi

mkdir $OUTPUT_DIR

mkdir $OUTPUT_DIR/vcf $OUTPUT_DIR/phylip

mv *.phylip $OUTPUT_DIR/phylip
mv *.vcf $OUTPUT_DIR/vcf

echo "DONE!"
