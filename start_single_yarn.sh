#########################################################################
# File Name: start_dssm.sh
# Author: xiulei
# mail: mingspy@163.com
# Created Time: Thu 12 Oct 2017 07:07:53 PM CST
#########################################################################
#!/bin/bash
#--archives=hdfs://ns3-backup/dw_ext/sinarecmd/junbao/pythonlib/Python_2.7.13_TF_1.2.0.zip#Python \

nohup TensorFlow_Submit \
--appName=gpu_cdssm_single \
--archives=hdfs://ns3-backup/dw_ext/sinarecmd/xiulei/bin/Python_tf1.2_gpu.zip#Python \
--files=./model.py,./data_helpers.py,./mytf_utils.py,./train.py \
--worker_memory=20480 \
--num_ps=0 \
--num_worker=1 \
--job_node_label_expression=gpu-p40 \
--worker_cores=2 \
--worker_gpu_cores=1 \
--data_dir=hdfs://ns3-backup/dw_ext/sinarecmd/xiulei/data/dssm \
--train_dir=hdfs://ns3-backup/dw_ext/sinarecmd/xiulei/output/dssm \
--command=Python/bin/python train.py  >& dssm.log & 

