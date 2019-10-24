library(Matrix)

tmp_data <- tempfile()
tmp_labels <- tempfile()

download.file(
  "https://statweb.stanford.edu/~tibs/strong/realdata/gisette_train.data",
  tmp_data
)

download.file(
  "https://statweb.stanford.edu/~tibs/strong/realdata/gisette_train.labels",
  tmp_labels
)

d <- scan(tmp_data, sep = " ")
x <- matrix(d, nrow = 6000, byrow = TRUE)[, 1:5000]
x <- as(x, "sparseMatrix")

dy <- scan(tmp_labels, sep = " ")
y <- (dy + 1)/2

gisette <- list(x = x, y = y)

usethis::use_data(gisette, overwrite = TRUE)
