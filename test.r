library(data.table)

df <- fread('dataset.csv')

df[, sentiment := factor(sentiment)]
df[, target := factor(target)]
df[, source := factor(source)]
levels(df$sentiment)

summary(df[sentiment != 'none'])

df[sentiment == 'normal', .N, by = .(source)]
df[, .N, by = .(sentiment)]
df[, .N, by = .(sentiment, source)]
df[, .N, by = .(sentiment, source)][, .N, by = sentiment]

saveRDS(df, 'dataset.RDS')
