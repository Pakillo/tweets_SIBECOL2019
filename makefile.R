system("Rscript gathertweet.R search '#sibecol2019 OR #sibecol19'")  # get new tweets
system("Rscript gathertweet.R update")   # update tweets data

rmarkdown::render(input = "index.Rmd")
