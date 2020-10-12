temp_file <- tempfile()

download.file(
  "https://archive.ics.uci.edu/ml/machine-learning-databases/00325/Sensorless_drive_diagnosis.txt",
  temp_file
)

tmp <- read.delim(temp_file, sep = " ", header = FALSE)

x <- as.matrix(tmp[, 1:48])
y <- tmp[, 49]

unlink(temp_file)

sensorless <- list(x = x, y = y)

usethis::use_data(sensorless, overwrite = TRUE)
