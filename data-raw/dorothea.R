library(Matrix)

tmp_data <- tempfile()
tmp_labels <- tempfile()

download.file(
  "https://statweb.stanford.edu/~tibs/strong/realdata/dorothea_train.data",
  tmp_data
)

download.file(
  "https://statweb.stanford.edu/~tibs/strong/realdata/dorothea_train.labels",
  tmp_labels
)

d <- readLines(tmp_data, n = 800)

makevec <- function(d) {
  j <- 1
  j0 <- 1
  nn <- nchar(d)
  xx <- NULL
  while (j < nn) {
    while (substring(d, j, j) != " ") {
      j <- j + 1
    }
    xx <- c(xx, as.numeric(substring(d, j0, j - 1)))
    j0 <- j + 1
    j <- j + 1
  }
  xx
}

x <- matrix(0,
            nrow = 800,
            ncol = 100000,
            byrow = TRUE)

for (i in 1:800) {
  o <- makevec(d[i])
  x[i, o] <- 1
}

oo <- colSums(x)
x <- x[, oo > 0]

dy <- scan(tmp_labels, sep = " ")
y <- (dy + 1) / 2

x <- scale(x, TRUE, FALSE)

dorothea <- list(x = x, y = y)

usethis::use_data(dorothea, overwrite = TRUE)
