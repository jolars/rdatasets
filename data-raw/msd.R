temp_file <- tempfile(fileext = ".zip")

download.file(
  "https://archive.ics.uci.edu/ml/machine-learning-databases/00203/YearPredictionMSD.txt.zip",
  temp_file
)

tmp <- read.csv(unz(temp_file, "YearPredictionMSD.txt"), header = FALSE)

y <- tmp[, 1]
x <- as.matrix(tmp[, -1])

unlink(temp_file)

msdyear <- list(x = x, y = y)

usethis::use_data(msdyear, overwrite = TRUE)

