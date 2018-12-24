#!/bin/bash
#COBALT -n 1
#COBALT -q gpu_mules
#COBALT -A Performance
#COBALT -t 5:00:00

export PATH=/soft/interpreters/python/intelpython/27/bin:$PATH

source activate mules-dl


python dcrnn_train.py --graph_pkl_filename=data-bi-flow/adj_mat.pkl --traffic_df_filename=data-bi-flow/flow.h5 --config_filename=data-bi-flow/dcrnn_test_config.yaml

python dcrnn_train.py --graph_pkl_filename=data-bi-speed/adj_mat.pkl --traffic_df_filename=data-bi-speed/speed.h5 --config_filename=data-bi-speed/dcrnn_test_config.yaml

python run_predict_flow.py --data_tag=data-bi-flow

python run_predict_speed.py --data_tag=data-bi-speed

python analysis.py

source deactivate








