
library(data.table)

df <- rbind(
  fread('english_dataset.tsv', sep='\t'),
  fread('hasoc2019_en_test-2919.tsv', sep='\t')
)

df

summary(df)

names(df) <- c("id", "text", "is_hate", "sentiment", "target")

df$is_hate <- factor(df$is_hate)
df$sentiment <- factor(df$sentiment)
df$target <- factor(df$target)

levels(df$target)

# df[df$target == "TIN"]
levels(df$target) <- c("none", "targeted", "untargeted")
df$target[df$target == "none"] <- NA

levels(df$sentiment)
levels(df$sentiment) <- c(  )

head(df[df$sentiment == "OFFN"]$text)

df <- df[, c("id", "sentiment", "target", "text")]
df[, c("source")] <- "25_twitter"

fwrite(df, "./processed.csv")
