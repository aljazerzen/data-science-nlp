
import pandas as pd

dataset = pd.read_csv('../dataset.csv')

print(f"{dataset.size=}")

pd.options.display.width = 1200
pd.options.display.max_columns = 20
print(dataset.describe())
