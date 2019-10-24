library(Matrix)

data <- tempfile()
labels <- tempfile()

download.file(
  "https://statweb.stanford.edu/~tibs/strong/realdata/arcene_train.data",
  data
)

d <- scan(data, sep = " ")

x <- matrix(d, nrow = 100, byrow = TRUE)[, 1:10000]
x <- Matrix(x, sparse = TRUE)

download.file(
  "https://statweb.stanford.edu/~tibs/strong/realdata/arcene_train.labels",
  labels
)

y <- scan(labels, sep = " ")
y <- (y + 1)/2

arcene <- list(x = x, y = y)

usethis::use_data(arcene, overwrite = TRUE)

unlink(labels)
unlink(data)
