# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.

setwd("C:/Users/JoeTurner/Documents/GitHub/cv")

# Knit the HTML version
rmarkdown::render("cv_turner.rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "cv.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv_turner.rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::find_chrome()
pagedown::chrome_print(input = "C:/temp/Rtmpo77fFw/file9f4c41c24084.html",
                       output = "cv_turner.pdf")

pagedown::chrome_print(input = "C:/Users/JoeTurner/Documents/GitHub/cv/cv_turner.html", 
                       output = "cv_turner.pdf")


