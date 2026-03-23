install.packages(c("rmarkdown", "pagedown", "knitr", "tidyverse"))

# render the Rmd to HTML
rmarkdown::render("poster/studenttemplatev2.Rmd")

# save the HTML as PDF using Chrome/Chromium
pagedown::chrome_print(
  input = "poster/studentposter.html",
  output = "poster/studentposter.pdf",
  options = list(
    printBackground = TRUE,
    preferCSSPageSize = TRUE
  )
)