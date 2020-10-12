library(e1071)
library(SparseM)
library(Matrix)

temp_file <- tempfile(fileext = ".RData")

download.file(
  "http://statweb.stanford.edu/~tibs/strong/NewsGroup.RData",
  temp_file
)

load(temp_file)

newsgroup <- list(x = NewsGroup$x, y = NewsGroup$y)

usethis::use_data(newsgroup, overwrite = TRUE)
