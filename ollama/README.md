# Ollama Install

Install via install.sh

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Blacklist Nouveau:

```bash
echo -e "blacklist nouveau\noptions nouveau modeset=0" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
```

Rebuild initramfs:

```bash
sudo update-initramfs -u
```

Verify after reboot

```bash
lsmod | grep -E 'nvidia|nouveau'
lspci -nnk -s 00:10.0
nvidia-smi
```

