#!/usr/bin/env bash
# script to clean mendeley bib files of crap

# by fields we want 
grep "^}\|^@incollection{\|@article{\|^@misc{\|^@book{\|^@phdthesis{\|^doi = {\|^journal = {\|^title = {\|^volume = {\|^year = {\|^url = {\|^pages = {\|^author = {" references.bib > references_reduced.bib

# by fields we don't want
grep -v "^file = {\|^issn = {\|^number = {\|^archivePrefix = {\|^arxivId = {\|^eprint = {\|^isbn = {\|^pmid = {\|^abstract = {\|^keywords = {\|^month = {" references.bib > references_reduced.bib

# sort the bib to remove duplicates
bibtool -s -i references_reduced.bib -o ~/output.bib