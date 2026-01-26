# Install pagedown if not already installed
# install.packages("pagedown")

library(pagedown)

# Convert the HTML poster to PDF
chrome_print("foundationsposter.html", output = "foundationsposter.pdf")
