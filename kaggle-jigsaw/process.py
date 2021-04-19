import pandas

df = pandas.read_csv('train.csv')

df = pandas.melt(df, 
  id_vars=['id', 'comment_text'],
  value_vars=['toxic', 'severe_toxic', 'obscene', 'threat', 'insult'],
  var_name='sentiment'
)

df.loc[df['value'] == 0, 'sentiment'] = 'none'

df.rename(columns = { 'comment_text': 'text' }, inplace=True)
df.loc[:, 'target'] = None
df = df[['id', 'sentiment', 'target', 'text']]

df.loc[:, 'source'] = 'kaggle-jigsaw'

# drop 99% of 'none' sentiment
none = df.loc[df['sentiment'] == 'none']

none = none.sample(frac = 0.01, random_state = 0)

df = df.loc[df['sentiment'] != 'none']
df = pandas.concat([df, none], axis=0)

df.to_csv('processed.csv', index=False)