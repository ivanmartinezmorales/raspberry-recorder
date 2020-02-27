#!/usr/bin/env python3

import time
import os 
from picamera import PiCamera
from subprocess import call

file_name = "/home/pi/status-log-file"

"""
Checks if a file exists in our file system
"""
def validate_log(file_name):
    if not os.path.isfile(file_name):
        f = open(file_name, "w+")
        print("A new log file has been created")
    print("The file already exists!")

"""
Generates log files for us to push to our log
"""
def generate_log():
    temp = os.popen("vcgencmd measure_temp").readline()
    timestamp = time.time()
    return "time={}, temp={}".format(timestamp, temp)

"""
Captures photos and repeats the sequence forever
"""
def repeat_photo_taking():
    camera = PiCamera()
    camera.start_preview()
    time.sleep(2)
    if os.path.exists("/home/pi/images"):
        for filename in camera.capture_continuous('/home/pi/images/img{counter:03d}.jpg'):
            with open("video_log", "a") as video_log:
                video_log.write("Captured photo %s at time %d" % (filename, time.time()))
            time.sleep(10) # Sleep ten seconds
    else:
        os.mkdir("/home/pi/images")

"""
Main function - makes log, appends to log and records photos
"""
def main():
    # Wait until the pi is completely booted up to start its thing with
    # @reboot configuration
    time.sleep(150)

    # Record when the pi turns on
    with open(file_name, "a") as log_file:
        log_file.write(generate_log())

    while True:
        repeat_photo_taking()
