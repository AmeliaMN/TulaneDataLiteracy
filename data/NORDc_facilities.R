NORDc_Facilities |>
select(Notes) |>
unnest_tokens(word, Notes, token = "words") |>
anti_join(stop_words) |>
count(word) |>
filter(n>3) |>
mutate(word = fct_reorder(word, n)) |>
  drop_na(word) |>
ggplot() + geom_col(aes(y=word, x = n))
