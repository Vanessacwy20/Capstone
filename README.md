

<!-- ABOUT THE PROJECT -->
## About The Project

This is an interactive learning application for data science.

### Built With

* docker (https://www.docker.com/)
* Rstudio (https://www.rstudio.com/)


<!-- GETTING STARTED -->
## Getting Started

### Docker

A customized docker image is used in this project.
* build docker image
  ```sh
  docker build . -t myrshiny
  ```
  
## Activate the application
### On Rstudio
1.  Install the required package
2.  Open the rmarkdown file in Rstudio
3.  Click Run Document

### On Docker
1.  Build docker image
2.  run docker
    ```sh
    docker run -p 3838:3838 -v ~ [your_project_folder_path]:/srv/shiny-server/ myrshiny
    ```
3.  Visit http://localhost:3838/

## Development

1. Recording the activity of the learnr code console

```sh
tutorial_options(exercise.eval = FALSE)

options(tutorial.event_recorder = new_recorder)
new_recorder <- function(tutorial_id, tutorial_version, user_id, event, data) {
    cat(tutorial_id, " (", tutorial_version, "): ", user_id, ", ", event, ", ", data$label, ", ", data$answers, ", ", data$correct, "\n", sep = "")
    # process data here
}
```
Reference Link: [https://stackoverflow.com/questions/51778262/how-can-i-record-exercise-submission-in-a-learnr-r-tutorial]


2. Read excel file
* Library used
  ```sh
  library(xlsx)
  ```
  
* Code
  ```sh
  CurrentLocation <- getwd()
  LoggingExcel <- gsub("/","//",paste(CurrentLocation,"QuickCheckLog.xlsx", sep = "/"))
  ```
  
3. Save to excel file
* Library used
  ```sh
  library(xlsx)
  ```
  
* Code
  ```sh
  Df <-  data.frame(User=c(LogUser),QuestionNo=c(data$label),Solution=c(AllSolution),Answer=c(QAnswer),Time=c(Sys.time()),Marks=c(Mark)) # Include data to dataframe
  xlsxDf <- read.xlsx(LoggingExcel, 1)  # read first sheet
  Df2 <-  subset( xlsxDf, select = -1 ) # unselect the first column (number column)
  newDf <- rbind(Df, Df2) # Combine two dataframes
  unlink(LoggingExcel) # Delete existing Excel
  write.xlsx(newDf, LoggingExcel, sheetName = "Sheet1", append = TRUE) # Create new excel file with new dataframe
  ```
  
4. Change css style
  
  You can change the style of the application with this
  ```sh
    ```{css, echo=FALSE}
    .btn-success{
      background-color: #FF9F98;
    }
    ```
  ```
 
  


