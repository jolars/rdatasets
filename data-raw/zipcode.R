temp_file <- tempfile(fileext = ".gz")

download.file(
  "https://web.stanford.edu/~hastie/ElemStatLearn/datasets/zip.train.gz",
  temp_file
)

con <- gzfile(temp_file)

xy <- matrix(scan(con), ncol = 257, byrow = TRUE)
y <- as.factor(xy[, 1])
x <- xy[, -1]

close.connection(con)

zipcode <- list(x = x, y = y)

usethis::use_data(zipcode, overwrite = TRUE)
