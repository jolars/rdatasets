library(e1071)
library(SparseM)

temp_file <- tempfile()

download.file(
  "https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/regression/cpusmall",
  temp_file
)

tmp <- e1071::read.matrix.csr(temp_file, fac = FALSE)

unlink(temp_file)

x <- as.matrix(tmp$x)
y <- tmp$y

cpusmall <- list(x = x, y = y)

usethis::use_data(cpusmall, overwrite = TRUE)

