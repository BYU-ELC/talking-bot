#!/bin/bash

# Created for the BYU ECEn Shop
# Created on Aug 3, 2023

printf ">>> \n\ncloning llama.cpp project"
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp
printf ">>> done cloning llama.cpp project"

# printf ">>> \n\n... there needs to be more to this script. download the models with the download model script."

printf ">>> making llama.cppp"
make

printf ">>> downloading models using the downloadmodels.bash script"
cd ../
bash downloadmodels.bash

printf ">>> finished downloading models"

cd llama.cpp/models/

printf ">>> installing python dependencies"
python3 -m pip install -r requirements.txt || true

printf ">>> converting models"
python3 convert.py models/7B/

printf ">>> quantizing models"
./quantize ./models/7B/ggml-model-f16.gguf ./models/7B/ggml-model-q4_0.gguf q4_0