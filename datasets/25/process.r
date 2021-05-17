
library(data.table)

df <- rbind(
  fread('english_dataset.tsv', sep='\t'),
  fread('hasoc2019_en_test-2919.tsv', sep='\t')
)

summary(df)

names(df) <- c("id", "text", "is_hate", "sentiment", "target")

df$is_hate <- factor(df$is_hate)
df$sentiment <- factor(df$sentiment)
df$target <- factor(df$target)

levels(df$target)

# df[df$target == "TIN"]
levels(df$target) <- c("none", "targeted", "untargeted")
df[target == "none", target := NA]

levels(df$sentiment)
levels(df$sentiment) <- c("hateful", "none", "offensive", "profanity")

head(df[sentiment == "offensive"]$text)

df

df <- df[, c("id", "sentiment", "target", "text")]
df[, c("source")] <- "25_twitter"

fwrite(df, "./processed.csv")
