library(tidyverse)

d = read_tsv('https://github.com/petyaracz/Racz2024/raw/refs/heads/main/resource/webcorpus2freqlist/webcorpus2_freqlist_hu_with_lemmafreq.tsv.gz')

# egerek = d |> 
#    filter(str_detect(form,'^(egér|egérnek|egerek|egereknek|egerem|egereim|# egereimnek|egeremnek|egere|egerei)$'))

# my_xpostags = egerek |> 
#     select(xpostag)

# write_tsv(my_xpostags, 'noun_xpostags.tsv', col_names = FALSE)

my_xpostags = read_tsv('noun_xpostags.tsv', col_names = FALSE) |> 
    pull(X1) |> 
    unique()

d2 = d |> 
    filter(xpostag %in% my_xpostags)

dim(d2)

d3 = d2 |> 
    filter(
        lemma_freq > 10,
        lemma_syl_count <= 3,
        nchar(lemma) <= 12,
        !str_detect(lemma, '[aáeéiíoóöőuúüű]$'),
        !str_detect(lemma, '[xw]')
        )
        
d3 |> 
    write_tsv('noun.tsv.gz')

d3 |>
    count(lemma) |> 
    filter(n == 12) |> 
    nrow()    