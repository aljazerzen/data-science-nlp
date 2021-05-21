# Natural language processing 2020/21

This repository contains the code for the project Offensive language exploratory analysis.
## Run experiments

The merged dataset used for analysis is contained in `dataset.zip`. Unzip it to the root directory.

We are using Anaconda environment. Run the following commands to run python scripts. You may change `myenv` to any other name.

```
$ conda create --name myenv --file requirements.txt
```

### Python

All python notebooks can be run using jupyter-lab. Run the following commands after setting up the environment.

```
$ conda activate myenv
$ jupyter-lab
```

### TF-IDF, Word2Vec, FastText

Use notebook `baseline_tfidf.ipynb` to reproduce results from TF-IDF, Word2Vec and FastText.
After running this notebook you can extract similar words using FastText by running `Offensive words exploration.ipynb`. 

### Statistical analysis, N-Grams, FastText, Word2Vec and Inter label analysis

Use notebook `Statistical_Methods.ipynb` to reproduce results from statistical analysis, N-Grams, FastText, Word2Vec and Inter label analysis.

### BERT & ELMo embeddings

Work on this area may be harder to reproduce due to hardware requirements. Dependencies (like TensorFlow) are installed from within the notebooks.

Notebooks `BERT.ipynb` and `ELMo.ipybn` were developed on Google Colab. Brief outline of the work is within corresponding `results.md` files.

## Corpus merging
### Sources

We based selection of out datasets on the website [https://hatespeechdata.com/](https://hatespeechdata.com/). 

We considered following datasets (dataset numbers relate to index on the website):
- *25 - great two different labels
- *20 - great many different labels
- *32 - not published, we contacted authors
- *16 - great, has weird hate sub-types
- *zenodo https://zenodo.figshare.com/articles/dataset/Hybrid_Approaches_to_Detect_Comments_Violating_Macro_Norms_on_Reddit/7598930/1
- *vulgartwitter https://github.com/ericholgate/vulgartwitter
- *kaggle-jigsaw https://www.kaggle.com/c/jigsaw-toxic-comment-classification-challenge/data
- cyberbullying
- 26 - just Twitter id and label
- 13 - two dataset, both have only Tweet id
- 15 - misogynistic - behind a locked Google Drive
- 10 - it's not from Twitter
- 12 - Fox-News, no labels
- 14 - just Twitter id

Datasets marked with (*) were chosen to be included in our merged corpus.

### R scripts

To preprocess each of the datasets into a merged corpus, we wrote a few R scripts utilizing suspiciously fast library `data.table`.

To preprocess datasets and merge them:
1. install R packages `data.table` and `stringr` (may require super user privileges)
    
        R> install.packages('data.table', 'stringr')
      
2. cd into each of the dataset's directories and run `process.r`

        $ cd datasets/20; R < process.r

3. run to merge each of the precessed datasets into one file

        $ cd datasets; sh merge.sh