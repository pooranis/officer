# wrap r logo with external_img ----
srcfile <- file.path( R.home("doc"), "html", "logo.jpg" )
extimg <- external_img(src = srcfile, height = 1.06/2,
                       width = 1.39/2)

# pptx example ----
doc <- read_pptx()
doc <- add_slide(doc)
doc <- ph_with(x = doc, value = extimg,
               location = ph_location_type(type = "body"),
               use_loc_size = FALSE )
print(doc, target = tempfile(fileext = ".pptx"))

fp_t <- fp_text(font.size = 20, color = "red")
an_fpar <- fpar(extimg, ftext(" is cool!", fp_t))

# docx example ----
x <- read_docx()
x <- body_add(x, an_fpar)
print(x, target = tempfile(fileext = ".docx"))

# svg example ----
svgfile <- file.path( R.home("doc"), "html", "Rlogo.svg" )
ext_svg <- external_img(src = svgfile, height = 1.06/2, width = 1.39/2)
x <- read_docx()
x <- body_add(x, ext_svg)
print(x, target = tempfile(fileext = ".docx"))

x <- read_pptx()
x <- add_slide(x)
# ph_location_type default is body
x <- ph_with(x, ext_svg, location = ph_location_type(), alt_text = alt_text, height = 1.06, width = 1.39, use_loc_size=FALSE)
print(x, target = 'temp.pptx')

