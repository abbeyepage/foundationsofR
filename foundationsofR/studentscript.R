
# Rename variables to make them easier to use
df <- mydata %>%
  rename(
    meaning = ml_meaning_slider,
    attend = RB_1_freq,
    pray = RB_2_freq,
    scripture = RB_3_freq,
    discuss = RB_4_freq,
    donate = RB_5_freq
  )

# Check for missing values in key variables
colSums(is.na(df[, c("meaning", "attend", "pray", "scripture", "discuss", "donate")]))

# Remove missing values ONLY for relevant variables
df_clean <- df %>%
  drop_na(meaning, attend, pray, scripture, discuss, donate)

# Create a new variable: mean religiosity score
df_clean <- df_clean %>%
  mutate(mean_religiosity = (attend + pray + scripture + discuss + donate) / 5)

# Check for missing values in key variables
colSums(is.na(df_clean[, c("meaning", "attend", "pray", "scripture", "discuss", "donate", "mean_religiosity")]))

df_clean %>%
  summarise(
    mean_meaning = mean(meaning),
    sd_meaning = sd(meaning),
    mean_religiosity_score = mean(mean_religiosity),
    sd_religiosity_score = sd(mean_religiosity),
    n = n()
  )

ggplot(df_clean, aes(x = meaning)) +
  geom_histogram(bins = 10) +
  labs(title = "Distribution of Meaning in Life",
       x = "Meaning Score",
       y = "Frequency")

ggplot(df_clean, aes(x = mean_religiosity)) +
  geom_histogram(bins = 10) +
  labs(title = "Distribution of Mean Religiosity",
       x = "Mean Religiosity Score",
       y = "Frequency")

model <- lm(meaning ~ mean_religiosity, data = df_clean)

summary(model)

ggplot(df_clean, aes(x = mean_religiosity, y = meaning)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Religiosity Predicting Meaning in Life",
       x = "Mean Religiosity",
       y = "Meaning in Life")