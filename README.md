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
`conda activate myenv`
`jupyter-lab`

### R
TODO Aljaz dodej kako se ta R pozene
### TF-IDF, Word2Vec, FastText

Use notebook `baseline_tfidf.ipynb` to reproduce results from TF-IDF, Word2Vec and FastText.
After running this notebook you can extract similar words using FastText by running `Offensive words exploration.ipynb`. 
