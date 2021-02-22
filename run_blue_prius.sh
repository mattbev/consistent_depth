#!/bin/bash

camera_model="PINHOLE"
camera_params="0, 0, -0.035265025029250387, 0.9996807883070832"

while getopts "s:d:" flag; do
    case "${flag}" in                                                                  v) video_dir="${OPTARG}" ;;
        s) source=$OPTARG ;;
        d) destination=$OPTARG ;;
    esac
done

#echo source: "$source"
#echo destination: "$destination"

sudo mkdir -p "${destination}"

sudo python3 main.py --video_file "${source}" --path "${destination}" --camera_model "${camera_model}" --camera_params "${camera_params}" --matcher "sequential" --model_type "monodepth2" --gpu_index "1" --make_video

