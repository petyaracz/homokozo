library(tidyverse)

d = read_tsv('noun.tsv.gz')

d |> 
    filter(form == 'embereidnek')
