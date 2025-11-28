# Data for all sessions  ---------------------------------------------------------
# * ------ library --------------------------------------------------------
print("global.R")
library(here)
library(shiny)
library(shinydashboard)
library(protegR)
library(tidyr)
library(purrr)
library(aws.s3)
library(readr)
library(dplyr)
library(shinyWidgets)
library(uuid)
library(stringr)
library(sodium)
library(cookies)
library(utilsHL)
library(shinyjs)
library(glue)

addResourcePath("images", "inst/app/www")

sessions <- new.env(parent = emptyenv())

# * ------ AWS connect + load config --------------------------------------
config_s3_location <- read_rds("inst/app/data/config_s3_location.rds")
config_s3_access <- read_rds("inst/app/data/config_s3_access.rds")

AWS_connection()
config_global <- s3readRDS(object = str_c(config_s3_location$s3_main_folder,"/config_files/config_global.rds"),
                           bucket = config_s3_location$s3_bucket)



