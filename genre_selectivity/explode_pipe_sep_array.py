import pandas as pd
from pandas import DataFrame

def read_write(inp, out):
    orig_data = pd.read_csv(inp)
    norm_data = DataFrame(orig_data.genres.str.split('|').tolist(), index=orig_data.movieId).stack()
    norm_data = norm_data.reset_index()[[0, 'movieId']]
    norm_data.to_csv(out, index=False)

if __name__ == '__main__':
    import sys
    if len(sys.argv) < 3:
        print ("Usage: {} <inp_file> <out_file>".format(argv[0]))
        sys.exit(1)
    read_write(sys.argv[1], sys.argv[2])
    sys.exit(0)
