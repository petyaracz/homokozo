library(tidyverse)

d = read_tsv('noun.tsv')

d |> 
    count(xpostag)

d |> 
    filter(freq > 1000) |> 
    group_by(xpostag) |> 
    sample_n(3) |> 
    select(form,lemma,freq,xpostag)

