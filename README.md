# Natural language processing 2020/21

This repository contains the code for the project Offensive language exploratory analysis.


## Setup python environment
We are using conda environment. Run the following commands to run python scripts. Change myenv to any other name.
`conda create --name myenv --file requirements.txt`

## Data

The dataset used for analysis is in `dataset.zip`. Unzip it to the root directory.

## Run scripts

### Python

All python notebooks can be run using jupyter-lab. Run the following commands after setting up the environment.

```
$ conda activate myenv
$ jupyter-lab
```

### R

To preprocess each of the datasets into a merged corpus, we wrote a few R scripts utilizing suspiciously fast library `data.table`.

To preprocess datasets and merge them:
1. install R packages `data.table` and `stringr` (may require super user privileges)
    
        $ R -e "install.packages('data.table', 'stringr')"
      
2. cd into each of the dataset's directories and run `process.r`

        $ cd datasets/20; R < process.r

3. run to merge each of the precessed datasets into one file

        $ cd datasets; sh merge.sh

### TF-IDF, Word2Vec, FastText

Use notebook `baseline_tfidf.ipynb` to reproduce results from TF-IDF, Word2Vec and FastText.
After running this notebook you can extract similar words using FastText by running `Offensive words exploration.ipynb`. 

### Statistical analysis, N-Grams, FastText, Word2Vec and Inter label analysis

Use notebook `Statistical_Methods.ipynb` to reproduce results from statistical analysis, N-Grams, FastText, Word2Vec and Inter label analysis.

### BERT & ELMo embeddings

Work on this area may be harder to reproduce due to hardware requirements. Dependencies (like TensorFlow) are installed from within the notebooks.

Notebooks `bert/BERT ours.ipynb` and `elmo/ELMo.ipybn` were developed on Google Colab. Brief outline of the work is within corresponding `results.md` files.
