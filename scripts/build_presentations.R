system2("quarto", c("render", "presentation"))


unlink("_book/presentation", recursive = TRUE)


dir.create(
  "_book/presentation",
  recursive = TRUE,
  showWarnings = FALSE
)

files <- list.files(
  "presentation/_presentation",
  full.names = TRUE,
  all.files = TRUE,
  no.. = TRUE
)

file.copy(
  from = files,
  to = "_book/presentation",
  recursive = TRUE
)

