wordcloud <- function(df, show, ...) {

  toremove <- c(quanteda::stopwords("en"),
                quanteda::stopwords("es"),
                "http", "https", "t.co")

  if (show == "words") {
    vec <- df$text
    toremove <- c(toremove,
                  "sibecol2019", "sibecol", "sibecol19", "_aeet_")
  }

  if (show == "hashtags") {
    vec <- unlist(df$hashtags)
  }

  if (show == "mentions") {
    vec <- na.omit(unlist(df$mentions_screen_name))
  }



  words <- quanteda::dfm(vec,
                        remove = toremove,
                        remove_punct = TRUE,
                        remove_twitter = TRUE,
                        remove_numbers = TRUE,
                        remove_url = TRUE)

  quanteda::textplot_wordcloud(words, #min_count = min.count,
                               random_order = FALSE,
                               rotation = .25,
                               color = RColorBrewer::brewer.pal(8,"Dark2"),
                               ...)

}

