
library(data.table)

df <- rbind(
  cbind(data.table(sentiment = 'appearance_harresment'), fread('Appearance Data.csv')),
  cbind(data.table(sentiment = 'intelligence_harresment'), fread('Intelligence Data.csv')),
  cbind(data.table(sentiment = 'political_harresment'), fread('Political Data.csv')),
  cbind(data.table(sentiment = 'racist'), fread('Racial Data.csv')),
  cbind(data.table(sentiment = 'sextual_harresment'), fread('Sextual Data.csv'))
)

df$Decision <- tolower(df$Decision)
df <- df[!(df$Decision == 'other' | df$Decision == 'others')]

df$Decision[df$Decision == 'n'] <- 'no'
df$Decision[df$Decision == '' | df$Decision == 'not sure'] <- NA
df$Decision <- factor(df$Decision)
df$sentiment <- factor(df$sentiment)

df <- df[!is.na(df$Decision)]
df <- df[Decision == "no", sentiment := "none"]
df[, Decision := NULL]

names(df) <- c("sentiment", "text")
df[, id := 1:.N]
df[, target := NA]

df <- df[, c("id", "sentiment", "target", "text")]
df[, source := "32_twitter"]

fwrite(df, './processed.csv')

