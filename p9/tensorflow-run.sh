#!/bin/bash
/opt/DL/license/bin/accept-powerai-license.sh
. /opt/DL/tensorflow/bin/tensorflow-activate

ngpu=$1
python benchmark_deep.py --ngpus=${ngpu} --nruns=4 --nsteps=1000 --nbatch 1000 --dtype float16 --dtype float32


