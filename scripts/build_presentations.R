unlink("_book/presentation", recursive = TRUE)

system2("quarto", c("render", "presentation"))


dir.create(
  "_book/presentation",
  recursive = TRUE,
  showWarnings = FALSE
)

files <- list.files(
  "presentation/_presentation",
  full.names = TRUE,
  all.files = TRUE,
  recursive = TRUE,
  no.. = TRUE
)
                                        # might be issue with extra html files, but embed-resources is true in quarto yml at root of presentation


file.copy(
  from = files,
  to = "_book/presentation",
  recursive = TRUE
)

