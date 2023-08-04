#!/bin/bash

# Created for the BYU ECEn Shop
# Created on Aug 3, 2023

printf "creating whisper.cpp folder"
mkdir whisper.cpp
cd whisper.cpp

printf "\n\ncloning whisper.cpp project"
git clone https://github.com/ggerganov/whisper.cpp.git
printf "\n\ndone cloning whisper.cpp project"

printf "\n\ngenerating base model for whisper and compiling"

cd whisper.cpp

bash ./models/download-ggml-model.sh base.en
make
