#!/bin/bash

echo "id,sentiment,target,text,source" > dataset.csv
for i in 25 35
do
  tail -n +2 $i/processed.csv >> dataset.csv
done