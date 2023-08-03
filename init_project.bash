# Created for the BYU ECEn Shop
# Created on Aug 3, 2023

# Use this script to initialize the project
# Follow up this script with the appropriate init scripts for
# whisper.cpp and llama.cpp

echo "creating whisper.cpp folder"
mkdir whisper.cpp
cd whisper.cpp

echo "cloning whisper.cpp project"
git clone https://github.com/ggerganov/whisper.cpp.git
echo "done cloning whisper.cpp project"

cd ..

echo "creating llama.cpp folder"
mkdir llama.cpp
cd llama.cpp

echo "cloning llama.cpp project"
git clone https://github.com/ggerganov/llama.cpp.git
echo "done cloning llama.cpp project"

echo "run the init scripts for each module now"