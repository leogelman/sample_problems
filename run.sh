#! /bin/bash
#
# prepare data - explode pipe-separated array in ./data/movies.csv into a set of rows
# 
python3 explode_pipe_sep_array.py ./data/movies.csv ./data/movies_norm.csv
#
# load data into MySQL db
#
mysql -uroot <./load_data.sql
#
# run the report
# 
mysql -uroot <report.sql
