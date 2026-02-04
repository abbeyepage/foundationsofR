# ============================================================
# Script: week3_practice.R -----------------------------------
# Purpose: Working with scripts and data frames
# Author: Your Name
# Date: 2026-02-01
# ============================================================


# 1.0 Setup ------------------------------------------------------

## 1.1 Packages   ------------------------------------------------
library(tidyverse)

## 1.2 Data import ------------------------------------------------
iris_data <- iris #from a preinstalled one  
mydata <- read.csv("data/mydata.csv")

### 1.2.1 Data inspection --------------------------------------------
head(mydata)


