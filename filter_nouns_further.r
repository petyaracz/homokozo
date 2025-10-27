library(tidyverse)

d = read_tsv('noun.tsv.gz')

d |> 
    filter(form == 'embereidnek')

keep_words = d |> 
    count(lemma,xpostag) |> 
    count(lemma) |> 
    filter(n == 16) |> 
    pull(lemma)

d2 = filter(d, lemma %in% keep_words)

d2 |> 
    filter(lemma == 'rész', str_detect(xpostag, 'Pl.Poss')) |> 
    select(lemma, form, xpostag)

d |> 
    distinct(lemma, llfpm10) |> 
    mutate(
        ntile_llfpm10 = ntile(llfpm10, 3)
    ) |> 
    filter(ntile_llfpm10 == 2)
