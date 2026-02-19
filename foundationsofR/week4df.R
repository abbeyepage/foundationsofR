#### TIDY VERSE VERBS DF ######
set.seed(1617)   # reproducible

df <- data.frame(
  student_id = 1:200,
  
  # Three groups A, B, C
  group = sample(c("A", "B", "C"), 
                 size = 200, 
                 replace = TRUE),
  
  # Exam mark out of 100
  mark = round(rnorm(200, mean = 65, sd = 12), 5),
  
  # Attendance percentage
  attendance = round(rnorm(200, mean = 82, sd = 10), 1),
  
  # Gender coded as 1,2,3
  gender_code = sample(c(1, 2, 3), 
                       size = 200, 
                       replace = TRUE),
  
  # Three height measures in cm
  h1 = round(rnorm(200, mean = 168, sd = 9), 1),
  h2 = round(rnorm(200, mean = 168, sd = 9), 1),
  h3 = round(rnorm(200, mean = 168, sd = 9), 1),
  
  # ---- Likert scale 1–5 (Strongly disagree → Strongly agree) ----
  lik1 = sample(1:5, 200, replace = TRUE),


# ----- GAD-7 ITEMS (0–3 scale) -----
gad1 = sample(0:3, 200, replace = TRUE),
gad2 = sample(0:3, 200, replace = TRUE),
gad3 = sample(0:3, 200, replace = TRUE),
gad4 = sample(0:3, 200, replace = TRUE),
gad5 = sample(0:3, 200, replace = TRUE),
gad6 = sample(0:3, 200, replace = TRUE),
gad7 = sample(0:3, 200, replace = TRUE)
)

# Keep marks within 0–100
df$mark[df$mark < 0] <- 0
df$mark[df$mark > 100] <- 100

head(df)

write_csv(df, "data/tidyversedf.csv")

### NA dataframes #### 

set.seed(1617)

DF <- data.frame(
  id = 1:20,
  
  # Some demographics with missingness
  gender = c(1,2,1,NA,2,3,1,2,NA,1, 2,1,3,2,NA,1,2,1,3,2),
  
  # Exam style variables
  mark = c(65,72,NA,55,81,77,68,NA,90,62,
           70,NA,58,66,74,80,NA,69,73,60),
  
  attendance = c(80,82,85,NA,78,90,88,84,NA,79,
                 81,83,87,86,82,NA,80,85,84,88),
  
  # Three height measures with occasional missing
  h1 = c(170,168,NA,165,172,169,167,NA,171,168,
         170,166,168,NA,169,167,172,168,170,169),
  
  h2 = c(171,167,168,166,NA,170,166,169,170,168,
         NA,167,169,170,168,166,171,167,NA,168),
  
  h3 = c(169,NA,167,165,171,168,NA,170,169,167,
         168,166,170,169,167,NA,170,168,169,167),
  
  # GAD-7 style items (1–4 Likert) with some skips
  gad1 = c(2,3,NA,1,2,3,2,NA,4,2, 3,2,1,2,NA,3,2,2,3,1),
  gad2 = c(3,2,1,NA,2,3,2,2,4,NA, 3,2,1,2,3,2,NA,2,3,1),
  gad3 = c(2,3,2,1,NA,3,2,2,4,2,  NA,2,1,2,3,2,2,NA,3,1),
  gad4 = c(2,3,2,1,2,NA,2,2,4,2,  3,NA,1,2,3,2,2,2,NA,1),
  gad5 = c(2,3,2,1,2,3,NA,2,4,2,  3,2,1,NA,3,2,2,2,3,1),
  gad6 = c(2,3,2,1,2,3,2,NA,4,2,  3,2,1,2,NA,2,2,2,3,1),
  gad7 = c(2,3,2,1,2,3,2,2,NA,2,  3,2,1,2,3,NA,2,2,3,1)
)

# View it
head(DF)

write_csv(DF, "data/NAdf.csv")
