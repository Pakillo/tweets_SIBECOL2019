print_tweet <- function(df) {
  if (nrow(df) > 1) df <- df[1, ]
  df$text <- gsub("\n+#", " #", df$text)
  df$text <- gsub("^#", " #", df$text)
  df$text <- gsub("^ #", " #", df$text)
  cat(df$text, "\n\n")
  cat(df$name, " (@", df$screen_name, ")", "\n\n", sep = "")
  cat("[", format(df$created_at, "%d-%m-%Y"), "](", df$status_url, ")\n", sep = "")
}
