import pandas

df = pandas.read_csv('macro-norm-violations-n10-t0-misogynistic-slurs.csv', header=None)

df.loc[:, 'sentiment'] = 'slur'
df.loc[:, 'target'] = None
df.reset_index(inplace = True)
df.rename(columns = { 0: 'text', 'index': 'id' }, inplace=True)

df = df[['id', 'sentiment', 'target', 'text']]

df.loc[:, 'source'] = 'zenodo'
df.to_csv('processed.csv', index=False)