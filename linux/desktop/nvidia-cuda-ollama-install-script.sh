#!/bin/bash
### Install Nvidia / Cuda in Linux to use with local Ollama

## lm-sensors
sudo apt install lm-sensors
sensors

## NVIDIA / Cuda / Toolkit
sudo apt install linux-headers-$(uname -r) make gcc dkms acpid
sudo apt install nvidia-driver firmware-misc-nonfree
sudo apt install nvidia-driver-cuda
sudo curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list |   sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' |   sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt install nvidia-container-toolkit
sudo nvidia-ctk cdi list
sudo nvidia-ctk cdi generate --output=/var/run/cdi/nvidia.yaml

## Ollama
./ollama serve

## Podman
podman run -d --network=host -e OLLAMA_BASE_URL=http://127.0.0.1:11434 -p 3000:8080 --gpus all -v open-webui:/app/backend/data --name open-webui ghcr.io/open-webui/open-webui:cuda
