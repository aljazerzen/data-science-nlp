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
df.to_csv('processed.csv', index=False)