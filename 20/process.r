
library(data.table)
library(stringr)

df <- fread("en_dataset_with_stop_words.csv")

# split sentiment into columns
df <- data.table(cbind(df,
  str_split_fixed(df$sentiment, "_", 8)
))
df[, sentiment := NULL]

# wider to longer
df <- melt(df, measure.vars = c('V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7', 'V8'), value.name = 'sentiment')
df[, variable := NULL]
df <- df[sentiment != ""]

# misogynistic := group == woman
misogynistic <-  df[group == 'women']
misogynistic[, sentiment := 'misogynistic']
df <- rbind(df, misogynistic)

# homophobic := group == sexual_orientation
homophobic <-  df[target == 'sexual_orientation']
homophobic[, sentiment := 'homophobic']
df <- rbind(df, homophobic)

df <- df[sentiment != 'normal']

df$tweet <- gsub("\\\\u([a-f]|\\d){4}", "", df$tweet)

df[, sentiment := factor(sentiment)]
df[, directness := factor(directness)]
df[, annotator_sentiment := factor(annotator_sentiment)]
df[, target := factor(target)]
df[, group := factor(group)]

names(df) <- c("id", "text", "directness", "annotator_sentiment", "target", "group", "sentiment")

summary(df)

df <- df[, c("id", "sentiment", "target", "text")]
df[, c("source")] <- "20_twitter"

fwrite(df, './processed.csv')
