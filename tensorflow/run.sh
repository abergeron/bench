#!/bin/bash

python benchmark_deep.py --ngpus=${ngpu} --nruns=4 --nsteps=1000 --nbatch 1000 \
       --dtype float16 --dtype float32


