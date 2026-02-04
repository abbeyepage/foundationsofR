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

