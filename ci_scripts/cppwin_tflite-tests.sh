#!/bin/bash

set -xe

source $(dirname "$0")/all-vars.sh
source $(dirname "$0")/all-utils.sh
source $(dirname "$0")/asserts.sh

bitrate=$1
set_ldc_sample_filename "${bitrate}"

model_source=${STT_TEST_MODEL}
model_name=$(basename "${model_source}")
export DATA_TMP_DIR=${CI_TMP_DIR}

download_material "${CI_TMP_DIR}/ds"

export PATH=${CI_TMP_DIR}/ds/:$PATH

check_versions

run_basic_inference_tests
