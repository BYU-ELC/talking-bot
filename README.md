# talking-bot

## Overview
This project is going to be an ecen-shop voice assistant, similar to siri or alexa. An eventual goal is to have this robot be able to answer commonly asked questions about the shop, such as where parts are located. Some additional features may be things such as creating a face for the robot, speaker face tracking, and translational movement.

This project is origianlly run on an Orange Pi 5, using the provided Armbian distro. It uses other libraries:
- The (whisper.cpp project)[]
- The (Llama.cpp project)[]
- (there will be one other one here).

In addition, make sure to run the commands necessary to unlock full gpu potential (I found these on the Armbian download page). You'll also need OpenCL to allow these programs to run on the GPU. See "OpenCL & CLBlast Notes" below for details.

### Notes on the bash scripts in the directory

**init_whisper.bash**: this script downloads whisper.cpp from the git repository, its base model (average size), and compiles the *main* program. Run with `bash init_whisper.bash`.
**init_llama.bash**: this script downloads llama.cpp from the git repository, downloads its 7B model (the lightest one), and compiles the program. **NOTE** that the model can take up to around 20-30 GB of storage **AND** this script will run for *hours*. Run with `bash init_llama.bash`.
**downloadmodels.bash**: this script downloads the llama.cpp models from a bittorrent endpoint (I think). I've got it setup to *only* download the 7B model because it's the smallest one. Run with `bash downloadmodels.bash`.

## Instructions [Incomplete]

I'll fill this out more as I get a good handle on things but for now each of the programs have their own way of running things.

## OpenCL & CLBlast Notes
### OpenCL
Both whisper.cpp and llama.cpp support building the application with OpenCL support so that the program can be run on the GPU. This will offload some work from the CPU! The Orange PI 5 has some video acceleration programs detailed on the OS download page. I've installed those. However, they are not OpenCL. To install OpenCL, use (this example)[https://clehaxze.tw/gemlog/2023/06-17-setting-up-opencl-on-rk3588-using-libmali.gmi]. I've copied the commands here in case that blog is ever removed:

*"Assuming you have successfully booted into your system. You need to download the ARM Mali GPU blob from rockchip's repository. And put it into /usr/lib/. As well as the firmware for the GPU if not already installed."*

```bash
cd /usr/lib
sudo wget https://github.com/JeffyCN/mirrors/raw/libmali/lib/aarch64-linux-gnu/libmali-valhall-g610-g6p0-x11-wayland-gbm.so

cd /lib/firmware
sudo wget https://github.com/JeffyCN/mirrors/raw/libmali/firmware/g610/mali_csffw.bin

sudo apt install mesa-opencl-icd clinfo

sudo mkdir -p /etc/OpenCL/vendors
echo "/usr/lib/libmali-valhall-g610-g6p0-x11-wayland-gbm.so" | sudo tee /etc/OpenCL/vendors/mali.icd

sudo apt install libxcb-dri2-0 libxcb-dri3-0 libwayland-client0 libwayland-server0 libx11-xcb1
```

*"Now you can run clinfo to see if OpenCL is working."*

```bash
clinfo
```

***If OpenCL is available, the number of platforms running should NOT be 0.***

### CLBlast
I don't exactly know what CLBlast is but it seems to be needed to compile these programs to run on OpenCL. I followed the instructions (here)[https://github.com/CNugteren/CLBlast/blob/master/doc/installation.md]. I had success downloading it with apt:
```bash
sudo apt install libclblast-dev
```
Althought that's good enough for me, that's not the *best* implementation, apparently. You can check the link for a better installation. I tried compiling it from the source code and got stuck with some missing headers.

## DEV NOTES
### Test quote:
I'm using this quote to compare the normal and CLBlast-version stream example.
> Non-magic people (more commonly known as Muggles) were particularly afraid of magic in medieval times, but not very good at recognizing it. On the rare occasion that they did catch a real witch or wizard, burning had no effect whatsoever. The witch or wizard would perform a basic Flame Freezing Charm and then pretend to shriek with pain while enjoying a gentle, tickling sensation. Indeed, Wendelin the Weird enjoyed being burned so much that she allowed herself to be caught no less than forty seven times in various disguises.