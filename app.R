simpleApp = function() {
library(shiny)
library(osca4anvil)

secs =  c("OSCA.intro", "OSCA.basic", "OSCA.advanced", "OSCA.workflows",
            "OSCA.multisample")
library(miniUI)

ui = miniPage(
 gadgetTitleBar("OSCA book gadget"),
 miniTabstripPanel(id="tabs",
   miniTabPanel("OSCA.intro",id="OSCA.intro", icon=icon("table"), shiny::dataTableOutput("curtab")),
   miniTabPanel("OSCA.basic", id="OSCA.basic", icon=icon("table"), helpText("a")), #, shiny::dataTableOutput("curtab")),
   miniTabPanel("OSCA.advanced", id="OSCA.advanced", icon=icon("table"), helpText("b")) #shiny::dataTableOutput("curtab"))
  )
 )


server = function(input, output, session) {
  observeEvent(input$done, {
     stopApp(NULL)
  })
  
  
  
  output$curtab = renderDataTable({
  elems = dir(paste0(input$tabs, "/inst/book/"), patt="Rmd$", full=TRUE)
  indi = grep("/index.Rmd", elems)
  if (length(indi)>0) elems = elems[-indi]
  belems = basename(elems)
  helems = gsub("Rmd", "html", belems)
  helems = gsub("getting-datasets", "getting-scrna-seq-datasets", helems) # shim 1
  helems = gsub("sce-class", "the-singlecellexperiment-class", helems) # shim 1
  tmplate = "<a href='https://bioconductor.org/books/3.14/%s/%s' target = '_blank'>read</a>"
  urls = sprintf(tmplate, input$tabs, helems )
  nch = sapply(elems, function(x) length(grep("```$", readLines(x))))
  ans = data.frame(Rmd = belems, urls=urls, nchunks=nch)
  rownames(ans) = NULL
  ans
  }, options=list(lengthMenu=c(20,50,100)), escape=FALSE)
 
}
runGadget(ui, server=server)
}
