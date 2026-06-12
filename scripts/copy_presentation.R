# Source folder (original project location)
src  <- "presentation/_presentation"
# Target folder inside the output site
dest <- "_book/presentation"

# Create destination if it doesn't exist
dir.create(dest, showWarnings = FALSE, recursive = TRUE)

# List everything directly inside the source folder
contents <- list.files(src, full.names = TRUE, all.files = TRUE, no.. = TRUE)

# Copy each item (file or directory) into dest
for (item in contents) {
  # recursive = TRUE handles subdirectories correctly
  file.copy(item, dest, recursive = TRUE, overwrite = TRUE)
}


message("Assets copied successfully to ", dest)
