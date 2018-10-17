#!/bin/bash
echo "1" | /opt/DL/license/bin/accept-powerai-license.sh
/opt/DL/pytorch/bin/install_dependencies
source /opt/DL/pytorch/bin/pytorch-activate

cd /workspace
python /workspace/main.py --epoch 0

/opt/DL/tensorflow/bin/install_dependencies
