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
               paths <- list.files("notes", pattern = ".Rmd", full.names = TRUE)
               
          } else {
               paths <- paste0(dir, "/", file)
          }
          
          # render all
          for (i in paths) {
               
               # self contained html page
               render(input = i, output_format = html_document(self_contained = TRUE),
                      output_dir = "notes/html", quiet = TRUE)
               cat(paste0("Rendering ", i, " as HTML\n"))
               # pdf
               render(input = i, output_format = "pdf_document", 
                      output_dir = "notes/pdf", quiet = TRUE)
               cat(paste0("Rendering ", i, " as PDF\n"))
               # markdown
               render(input = i, output_format = "md_document",
                      output_dir = "notes/md",
                      quiet = TRUE)
               cat(paste0("Rendering ", i, " as MD\n"))
               # R code
               purl(input = i, documentation = 1)
               cat(paste0("Generating ", i, " as R-Script\n"))
          }
     }



