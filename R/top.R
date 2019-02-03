tweets_most_liked <- function(df, n = 10) {
  df.sorted <- dplyr::top_n(df, n, wt = favorite_count) %>%
    dplyr::arrange(desc(favorite_count))
}

tweets_most_RT <- function(df, n = 10) {
  df.sorted <- dplyr::top_n(df, n, wt = retweet_count) %>%
    dplyr::arrange(desc(retweet_count))
}

tweets_most_recent <- function(df, n = 10) {
  df.sorted <- dplyr::top_n(df, n, wt = created_at) %>%
    dplyr::arrange(desc(created_at))
}


users_most_active <- function(df, n = 10) {
  df.sorted <- df %>%
    group_by(screen_name) %>%
    summarise(ntweets = n()) %>%
    ungroup() %>%
    arrange(desc(ntweets)) %>%
    slice(1:n)
}



users_most_liked <- function(df, n = 10) {
  df.sorted <- df %>%
    group_by(screen_name) %>%
    summarise(nlikes = sum(favorite_count)) %>%
    ungroup() %>%
    arrange(desc(nlikes)) %>%
    slice(1:n)
}



users_most_RT <- function(df, n = 10) {
  df.sorted <- df %>%
    group_by(screen_name) %>%
    summarise(nrt = sum(retweet_count)) %>%
    ungroup() %>%
    arrange(desc(nrt)) %>%
    slice(1:n)
}
