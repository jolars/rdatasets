## code to prepare `physician` dataset goes here

temp_file <- tempfile(fileext = ".zip")
temp_dir <- tempdir()

download.file(
  "https://www.jstatsoft.org/index.php/jss/article/downloadSuppFile/v027i08/DebTrivedi.rda.zip",
  temp_file
)

unzip(temp_file, files = "DebTrivedi.rda", exdir = temp_dir)

env <- new.env()

load(file.path(temp_dir, "DebTrivedi.rda"), env)

deb <- env$DebTrivedi

y <- deb$ofp
x <- deb[, 7:ncol(deb)]

x <- glmnet::makeX(x)

physician <- list(x = x, y = y)

usethis::use_data(physician, overwrite = TRUE)
