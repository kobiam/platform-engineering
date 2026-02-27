# Linux Desktop

## tracker-miner

Gnome tool that indexes your home folder so that searches in your file manager are faster.

Disable tracker-miner
```bash
sudo systemctl --global mask tracker-miner-fs-3.service
sudo systemctl --global mask tracker-xdg-portal-3.service
```
<<<<<<< HEAD

=======
>>>>>>> 5867a6f578ddef9af3464e5afc3cd0815644b161
## GPU

Set Up Hardware Video Acceleration with a Radeon (AMD) Card on Linux Ubuntu

- Install VA-API and GStreamer backends for AMD:

```bash
sudo apt install mesa-va-drivers vainfo gstreamer-vaapi
```

- Check VA-API:

```bash
vainfo
```

### Enable Hardware Acceleration in Firefox

1. Open Firefox and go to `about:config`
2. Set the following preferences:
    - media.ffmpeg.vaapi.enabled → true
    - gfx.webrender.all → true (if not already enabled)
    - media.ffvpx.enabled → false

3. Restart Firefox

To confirm, visit `about:support` and look for `HARDWARE_VIDEO_DECODING`

### Enable Hardware Acceleration in Chromium-Based Browsers

Check `chrome://gpu` for "Video Decode: Hardware accelerated"
