FROM rocker/shiny

RUN apt update && apt-get install libxml2
RUN apt install -y default-jdk libsodium-dev

RUN Rscript -e 'install.packages(c("tidyverse","nycflights13","Lahman"))'
RUN Rscript -e 'install.packages(c("mosaic","mosaicCalc","ggformula"))'

RUN Rscript -e 'install.packages(c("RSQLite","DBI","devtools","shinyauthr"))'
RUN Rscript -e 'install.packages(c("datamodelr","htmltools","rpivotTable","rJava","xlsxjars","xlsx"))'

RUN Rscript -e 'devtools::install_github("bergant/datamodelr")'
RUN Rscript -e 'devtools::install_github("dtkaplan/submitr")'
RUN Rscript -e 'devtools::install_github("rundel/learnrhash")'

RUN Rscript -e 'install.packages(c("learnr","XLConnect"))'

RUN Rscript -e 'install.packages(c("DT","shinythemes","DiagrammeR"))'


