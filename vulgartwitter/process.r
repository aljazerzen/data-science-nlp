
library(data.table)

df <- fread("vulgar_cleaned_data.tsv")

summary(df)

df[, sentiment := "vulgar"]
df[, target := NA]

df <- df[, c("Tweet ID", "sentiment", "target", "Tweet")]
names(df) <- c("id", "sentiment", "target", "text")
df[, c("source")] <- "vulgartwitter"

fwrite(df, "./processed.csv")
