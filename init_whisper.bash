# Created for the BYU ECEn Shop
# Created on Aug 3, 2023

# Use this script to initialize the project
# Follow up this script with the appropriate init scripts for
# whisper.cpp and llama.cpp

echo "creating whisper.cpp folder"
mkdir whisper.cpp
cd whisper.cpp

echo "\n\ncloning whisper.cpp project"
git clone https://github.com/ggerganov/whisper.cpp.git
echo "\n\ndone cloning whisper.cpp project"

echo "\n\ngenerating base model for whisper and compiling"

cd whisper.cpp

bash ./models/download-ggml-model.sh base.en
make
