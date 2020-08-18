
DATE=$(date +"%Y-%m-%d_%H%M")
export PYTHONPATH=\home\pi\AIY-projects-python\src\aiy\:$PYTHONPATH

#Stop Joy Detector
sudo systemctl stop joy_detection_demo

#Go to the USB
cd /media/pi/4GB/dominadas

#start recording indicator
python3 start_recording.py

# Capture 30 seconds of raw video at 640x480 and 150kB/s bit rate into a pivideo.h264 file:
raspivid -t 33000 -w 640 -h 480 -fps 25 -b 1200000 -p 0,0,640,480 -o pivideo.h264

#stop recording indicator
python3 end_recording.py

# Wrap the raw video with an MP4 container:
MP4Box -add pivideo.h264 $DATE.mp4

# Remove the source raw file, leaving the remaining pivideo.mp4 file to play
rm pivideo.h264