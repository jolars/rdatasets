library(e1071)
library(SparseM)
library(Matrix)

temp_file <- tempfile(fileext = ".txt")

# test set
download.file(
  "https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/QJEUKR/PGPWAK",
  temp_file
)

tmp <- e1071::read.matrix.csr(temp_file, fac = TRUE)

x <- as(tmp$x, "dgCMatrix")
y <- tmp$y

e2006_test <- list(x = x, y = y)

# train set
download.file(
  "https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/QJEUKR/COBOGK",
  temp_file
)

tmp <- e1071::read.matrix.csr(temp_file, fac = TRUE)

unlink(temp_file)

x <- as(tmp$x, "dgCMatrix")
y <- tmp$y

e2006_train <- list(x = x, y = y)

e2006 <- list(train = e2006_train, test = e2006_test)

usethis::use_data(e2006, overwrite = TRUE)
