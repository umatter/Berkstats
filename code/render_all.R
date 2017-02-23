###############################################
# Berkstats course: Render all rmd notebooks
###############################################

render_all <- 
     function(dir = "notes", file = NULL) {
          # load packages 
          require(knitr)
          require(rmarkdown)
          
          if (is.null(file)) {
               # get paths of all RMD files in dir
               files <- list.files("notes", pattern = ".Rmd", full.names = TRUE)
               
          } else {
               files <- paste0(dir, "/", file)
          }
          
          # render all
          for (f in files) {
               
               # self contained html page
               render(input = f, output_format = html_document(self_contained = TRUE),
                      output_dir = "notes/html", quiet = TRUE)
               cat(paste0("Rendering ", f, " as HTML\n"))
               # pdf
               render(input = f, output_format = "pdf_document", 
                      output_dir = "notes/pdf", quiet = TRUE)
               cat(paste0("Rendering ", f, " as PDF\n"))
               # markdown
               render(input = f, output_format = "md_document",
                      output_dir = "notes/md",
                      quiet = TRUE)
               cat(paste0("Rendering ", f, " as MD\n"))
               # R code
               purl(input = f, documentation = 1)
               cat(paste0("Generating ", f, " as R-Script\n"))
          }
     }



