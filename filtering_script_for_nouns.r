library(tidyverse)

d = read_tsv('https://github.com/petyaracz/Racz2024/raw/refs/heads/main/resource/webcorpus2freqlist/webcorpus2_freqlist_hu_with_lemmafreq.tsv.gz')

egerek = d |> 
    filter(str_detect(form,'^(egér|egérnek|egerek|egereknek|egerem|egereim|egereimnek|egeremnek|egere|egerei)$'))

my_xpostags = egerek |> 
    pull(xpostag)

d2 = d |> 
    filter(xpostag %in% my_xpostags)

dim(d2)

d3 = d2 |> 
    filter(
        freq > 10,
        lemma_syl_count == 2,
        nchar(lemma) == 6,
        !str_detect(lemma, '[aáeéiíoóöőuúüű]$')
        )
        
d3 |> 
    write_tsv('noun.tsv')
