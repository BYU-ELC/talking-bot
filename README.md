# talking-bot

### Overview
This project is going to be an ecen-shop voice assistant, similar to siri or alexa. An eventual goal is to have this robot be able to answer commonly asked questions about the shop, such as where parts are located. Some additional features may be things such as creating a face for the robot, speaker face tracking, and translational movement.

## Installation notes
This project is origianlly run on an Orange Pi 5, using the provided Armbian distro. Note that this distro doesn't include everything that is needed to run this project. For instance you'll need:
- The whisper.cpp project ()
- The Llama.cpp project ()
- (there will be one other one here).

In addition, make sure to run the commands necessary to unlock full gpu potential (I found these on the Armbian download page). You'll also need OpenCL to allow these programs to run on the GPU. Follow these instructions to get there: https://clehaxze.tw/gemlog/2023/06-17-setting-up-opencl-on-rk3588-using-libmali.gmi

There is a program in the main directory of this project to assist in downloading the original Llama model weights. You'll need to run that program to download the 7B model.

## Instructions [Incomplete]

I'll fill this out more as I get a good handle on things but for now each of the programs have their own way of running things.




# DEV NOTES
The command
sudo bash downloadmodels.bash && cd llama.cpp/ && python3 convert.py models/7B && ./quantize ./models/7B/ggml-model-f16.bin ./models/7B/ggml-model-q4_0.bin q4_0