# Load required package
library(tidyverse)

# Create folder to save datasets
dir.create("student_datasets", showWarnings = FALSE)

# Student names
students <- tribble(
  ~FirstName, ~Surname,
  "KENZO MAFOYA ANGE", "VILLACA",
  "JANHAVI", "JOSHI",
  "SAM", "LUMMIS",
  "AKASH", "DAS",
  "ALISHA", "HUSSAIN",
  "MULOK", "IBRAHIM",
  "QIRAT", "EHSAN",
  "KIERAN", "FIELD",
  "ALIYA", "MOITRA",
  "LINDA", "SOORIYAKUMAR",
  "RIHANNA", "REYNOLDS",
  "ZAHARA", "KHAN",
  "NAJIBA", "SARWARI",
  "RIMSHA", "SHAKEEL",
  "AYESHA", "TARIQ",
  "MALAKAI", "BELL-BODKIN",
  "ROMARIO", "GOODING",
  "KULANI", "RANASINGHAGE",
  "DANESH", "REHMAN",
  "DAANA", "IRSALIEVA",
  "FATIMA", "AHSAN",
  "ZOE", "NICHOLLS",
  "TEMPANI", "HARRIS",
  "POPPY", "LOVE",
  "SHAHANA", "SINNARASA",
  "THESHAN", "PERABAKARAN",
  "JEREMY", "AKENA",
  "JOANA", "AZIZI",
  "KAL", "LICHACZ",
  "ALFIE", "HORAN",
  "AMEL", "BAHIR",
  "DANNE", "RUIZ NAJERA",
  "ISA", "ALI",
  "NATHAN", "MWANJA",
  "ZOEY SOPHIA", "ANDREOU",
  "MAGDALENA", "LISZKA",
  "MICHAL", "TOCZEK",
  "KAYLA", "PIRES",
  "NICHOLAS", "CLARK-CUENCO",
  "NERINGA", "RECENTES",
  "ANGILA", "OMAR",
  "RYAN", "KARKUT",
  "HETTIE", "WINTER",
  "VRUTTI", "SONI",
  "CONNOR", "CAMPBELL",
  "MAL", "ZADRAN",
  "ALEEZA", "UDDIN",
  "ANA", "DIMOSTHENOUS",
  "YASMINE", "AMMARKHODJA",
  "SARAH", "GORDON",
  "ADRIAN", "REYNOLDS",
  "SHARIKA", "SIKDER",
  "SAGHAR", "BALADI",
  "ZAYNAB", "HUSSEIN",
  "NABIL", "ZIOUANI",
  "NAWAL", "SHAHID",
  "ARSHIA", "AHMED",
  "LILLY", "BRONCZYK",
  "SAMIHA", "RAZZAQUI",
  "KAWTHER", "ABID-ALI",
  "DEVAUGHN", "LEWINSON",
  "JOANNA", "MICHALOPOULOU",
  "ALEEZA", "TARIQ",
  "ZANE", "MILLINGTON",
  "FREYA", "SHAH",
  "MADINA TARAKI", "TARAKI",
  "LISA", "YEE KEOW",
  "FAE NAJIM", "NAJIM",
  "ARTHVI", "GUDKA",
  "EMILY", "THORNE",
  "SCARLET", "DOWN",
  "DYLAN", "GREWAL",
  "SHARON", "BANCIL",
  "SHAIMAA", "OMAR",
  "NOAH", "TURNER",
  "ANEESA", "BEGUM",
  "KATIE", "BARHAM",
  "LILY", "KNOX",
  "IMMY", "SELLINGS",
  "ALEX", "CHRISTOPHER",
  "JOSH", "LOMAX",
  "SAHITHI", "MANIKALA",
  "BEE", "CHALMERS",
  "MAHA", "PALECPEC",
  "SARAH", "EJAZ",
  "AMISHI", "KAURA",
  "SOFIA", "MAHDAVI-JOVEINI",
  "BETSY", "MEADS",
  "KUBA", "MAZUR",
  "AMINA NOR", "MOHAMMED",
  "ANMOL", "PANCHAL",
  "HAJRA", "MUSALLI",
  "SHAILI", "PAPOUSHADO",
  "ALEXUS", "FORBES-FENTY",
  "SILA", "SHOGUNLE",
  "KARINA", "SEMELIAK",
  "GULCIN", "DOGAN",
  "MALAK", "BOUYA",
  "CAMILLE", "ROWE",
  "AYMAN", "KHAN",
  "RIA", "MATHARU",
  "CASSIE", "SOUTHGATE",
  "ASAL", "MOHSENI",
  "ZAHRAA", "JABBAR",
  "RABIYA", "YASIN",
  "KATHRINE", "IVANOVA",
  "COSMIN", "BURDUSEL",
  "CHRISTINA", "AUDISHO",
  "YASVI", "SRIDHARAN",
  "LIZA", "FARID",
  "KYLE", "DAWES",
  "AWRNY", "SARKAR",
  "JUAN PABLO", "BARRETO MOLINA",
  "KATERINA", "PAPADIMITRIOU",
  "RINAD", "ABDULRAHEEM",
  "FAIZ", "HUSSAIN",
  "CATALINA", "CHELARU",
  "STEVIE", "FRANCIS",
  "NAVNIDHI", "GIRI",
  "RUMAYSA", "NASSER",
  "REBECCA", "MARIANI",
  "SHERRAL", "PAYTON",
  "EVA", "MAAROOF"
)

# Loop over each student
for(i in 1:nrow(students)){
  
  n <- 50
  psn_id <- 1:n
  
  age_yrs <- round(rnorm(n, mean = 42, sd = 15))
  age_yrs[age_yrs < 18] <- sample(18:21, sum(age_yrs < 18), replace = TRUE)
  
  sex_cat <- sample(c("Male", "Female", "Non-binary", "Prefer not to say"),
                    n, replace = TRUE, prob = c(.45, .45, .05, .05))
  
  latent_religiosity <- rnorm(n, mean = 0, sd = 1)
  
  RB_1_freq <- round(pmin(pmax(4 + latent_religiosity + rnorm(n,0,.8),1),7))
  RB_2_freq <- round(pmin(pmax(4 + latent_religiosity + rnorm(n,0,.8),1),7))
  RB_3_freq <- round(pmin(pmax(4 + latent_religiosity + rnorm(n,0,.8),1),7))
  RB_4_freq <- round(pmin(pmax(4 + latent_religiosity + rnorm(n,0,.8),1),7))
  RB_5_freq <- round(pmin(pmax(4 + latent_religiosity + rnorm(n,0,.8),1),7))
  
  religiosity_mean <- (RB_1_freq + RB_2_freq + RB_3_freq + RB_4_freq + RB_5_freq) / 5
  ml_meaning_slider <- round(pmin(pmax(40 + 8 * religiosity_mean + rnorm(n, 0, 10), 0), 100))
  
  make_missing <- function(x){
    miss_index <- sample(1:n, size = round(0.05*n))
    x[miss_index] <- NA
    return(x)
  }
  
  RB_1_freq <- make_missing(RB_1_freq)
  RB_2_freq <- make_missing(RB_2_freq)
  RB_3_freq <- make_missing(RB_3_freq)
  RB_4_freq <- make_missing(RB_4_freq)
  RB_5_freq <- make_missing(RB_5_freq)
  ml_meaning_slider <- make_missing(ml_meaning_slider)
  
  df <- tibble(
    psn_id,
    age_yrs,
    sex_cat,
    ml_meaning_slider,
    RB_1_freq,
    RB_2_freq,
    RB_3_freq,
    RB_4_freq,
    RB_5_freq
  )
  
  # Safe file name (replace spaces with underscores)
  file_name <- paste0(students$FirstName[i], "_", students$Surname[i], ".csv")
  file_name <- gsub(" ", "_", file_name)
  
  write_csv(df, file.path("student_datasets", file_name))
}