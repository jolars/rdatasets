library(e1071)
library(SparseM)
library(Matrix)

temp_file <- tempfile(fileext = ".bz2")

download.file(
  "https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/regression/E2006.test.bz2",
  temp_file
)

zz <- bzfile(temp_file)

tmp <- e1071::read.matrix.csr(bzfile(temp_file), fac = TRUE)

unlink(temp_file)

x <- as(tmp$x, "sparseMatrix")
y <- tmp$y

e2006_tfidf <- list(x = x, y = y)

usethis::use_data(e2006_tfidf, overwrite = TRUE)
