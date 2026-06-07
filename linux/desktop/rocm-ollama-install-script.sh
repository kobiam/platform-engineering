#!/bin/bash
# manual install ollama

# download
wget https://ollama.com/download/ollama-linux-amd64.tar.zst
wget https://ollama.com/download/ollama-linux-amd64-rocm.tar.zst

# extract
tar -x -f /ollama-linux-amd64.tar.zst
tar -x -f ollama-linux-amd64-rocm.tar.zst

# permissions
sudo usermod -aG video,render $USER

# using a standalone binary from a custom folder
# not share the RAM and use only VRAM
LD_LIBRARY_PATH=~/Downloads/ollama-linux-amd64-rocm/lib/ollama ~/Downloads/ollama-linux-amd64/bin/ollama serve

# shares system RAM rather than having its own dedicated VRAM
OLLAMA_IGPU_ENABLE=1 LD_LIBRARY_PATH=~/Downloads/ollama-linux-amd64-rocm/lib/ollama ~/Downloads/ollama-linux-amd64/bin/ollama serve

# memory-efficient with context_length
OLLAMA_IGPU_ENABLE=1 OLLAMA_CONTEXT_LENGTH=8192 OLLAMA_KV_CACHE_TYPE=q8_0 LD_LIBRARY_PATH=~/Downloads/ollama-linux-amd64-rocm/lib/ollama ~/Downloads/ollama-linux-amd64/bin/ollama serve
