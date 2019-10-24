tmp <- tempfile()

download.file(
  "https://statweb.stanford.edu/~tibs/strong/ltrain.x",
  tmp
)

x <- t(matrix(scan(tmp), nrow = 7129, byrow = TRUE))
y <- double(38)
y[1:27] <- 0
y[28:38] <- 1

golub <- list(x = x, y = y)

usethis::use_data(golub, overwrite = TRUE)

unlink(tmp)
