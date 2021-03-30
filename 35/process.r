
library(data.table)

df <- fread("en_dataset_with_stop_words.csv")

df

names(df) <- c("id", "text", "sentiment", "directness", "annotator_sentiment", "target", "group")

df$sentiment <- factor(df$sentiment)
df$directness <- factor(df$directness)
df$annotator_sentiment <- factor(df$annotator_sentiment)
df$target <- factor(df$target)
df$group <- factor(df$group)

summary(df)


levels(df$group)

levels(df$sentiment)
# fearful, abusive, offensive, disrespectful, hateful, normal
df[grepl('.*abusive.*', df$sentiment)]$sentiment <- "abusive"
df[grepl('.*normal.*', df$sentiment)]$sentiment <- "hateful"
df[grepl('.*hateful.*', df$sentiment)]$sentiment <- "hateful"
df[grepl('.*disrespectful.*', df$sentiment)]$sentiment <- "disrespectful"
df[grepl('.*offensive.*', df$sentiment)]$sentiment <- "offensive"

df$sentiment <- factor(df$sentiment)
levels(df$sentiment)

df <- df[, c("id", "sentiment", "target", "text")]
df[, c("source")] <- "35_twitter"

fwrite(df, './processed.csv')
