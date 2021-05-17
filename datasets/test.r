library(data.table)
options(width = 300)

df <- fread('../dataset.csv')

df[, sentiment := factor(sentiment)]
df[, target := factor(target)]
df[, source := factor(source)]
levels(df$sentiment)

summary(df[sentiment != 'none'])

df[sentiment == 'normal', .N, by = .(source)]
df[, .N, by = .(sentiment)]
df[, .N, by = .(sentiment, source)]
df[, .N, by = .(sentiment, source)][, .N, by = sentiment]
df[, .N, by = .(source)]
df[, .N]

df[sentiment == 'normal', .N, by = .(source)]

sentiment_source <- dcast(df, sentiment ~ source)
library(xtable)
xtable(sentiment_source, type = "latex")
