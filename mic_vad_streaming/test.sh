#!/bin/bash

set -xe

#sudo /Users/marianogonzalez/balto/development/STT-examples/mic_vad_streaming/env/bin/activate

THIS=$(dirname "$0")

pushd ${THIS}
#  source ../tests.sh

#  pip install --user $(get_python_wheel_url "$1")
#  pip install --user -r <(grep -v stt requirements.txt)

  pulseaudio &

  #./model.pbmm doesnt work
  python3 mic_vad_streaming.py \
	  --model ./model.tflite  \
	  --scorer ./kenlm_es.scorer \
	  --device 0 \
	  --savewav /tmp
popd
