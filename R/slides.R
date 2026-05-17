slides_iframe <- function(height = 600) {

  input <- knitr::current_input()

  base <- tools::file_path_sans_ext(
    basename(input)
  )

  html <- sprintf(
'
<iframe
  src="../presentation/%s.html"
  width="100%%"
  height="%s"
  style="border:none;">
</iframe>
',
    base,
    height
  )

  knitr::asis_output(html)
}
