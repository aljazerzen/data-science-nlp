import pandas

df = pandas.read_json('CONAN.json', orient = 'records')

df = df[df['cn_id'].str.startswith('EN')]

df['sentiment'] = 'political_harassment'
df['target'] = 'muslims'
df.rename(columns = { 'cn_id': 'id', 'hateSpeech': 'text' }, inplace=True)

df = df[['id', 'sentiment', 'target', 'text']]
df.loc[:, 'source'] = '16_facebook'
df.to_csv('processed.csv', index=False)