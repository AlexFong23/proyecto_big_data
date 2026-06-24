#!/bin/bash

hdfs dfs -mkdir -p /datasets/lcl

hdfs dfs -put \
/workspace/data/raw/*.csv \
/datasets/lcl

hdfs dfs -ls /datasets/lcl