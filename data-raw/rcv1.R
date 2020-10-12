library(e1071)
library(SparseM)
library(Matrix)

temp_file <- tempfile(fileext = ".bz2")

download.file(
  "https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/binary/rcv1_train.binary.bz2",
  temp_file
)

tmp <- e1071::read.matrix.csr(bzfile(temp_file), fac = TRUE)

unlink(temp_file)

x <- as(tmp$x, "dgCMatrix")
y <- tmp$y

rcv1 <- list(x = x, y = y)

usethis::use_data(rcv1, overwrite = TRUE)

