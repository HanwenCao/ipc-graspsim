#!/usr/bin/env bash

OBJ=$1		# e.g., cube_3cm
GRASP_IND=$2	# e.g., 0

CPU_IND=0

E_VAL=1e8
MU_VAL=0.4

IMAGE_NAME="ipc-graspsim"

# to do single run

sudo docker run --rm -it \
	-v $(pwd)/tools:/IPC_sim/tools/ \
	-v $(pwd)/output:/IPC_sim/output/ \
	-v $(pwd)/dexgrasp_data/:/IPC_sim/dexgrasp_data/ \
	--cpuset-cpus ${CPU_IND} -m 4g \
	${IMAGE_NAME} /bin/bash -c "python3 tools/grasping/augment_objs.py output/obj_copy"
	
#~/Downloads/blender-3.0.0-linux-x64/blender -b -P ./tools/grasping/render_grasp.py output/cube_3cm_0_2021-12-22T01:38:12.129025
