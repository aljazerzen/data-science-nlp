#!/bin/bash

echo "id,sentiment,target,text,source" > dataset.csv
for i in 25 32 20 16 kaggle-jigsaw vulgartwitter
do
  tail -n +2 $i/processed.csv >> dataset.csv
done