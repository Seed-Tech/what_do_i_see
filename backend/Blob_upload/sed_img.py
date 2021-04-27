#!/usr/bin/python3
"""This module send an image through http.
Usage:
    Change variable "addr" to required address, execute it like this:
    "./send_img.py <path to image>"
"""
import requests
import cv2
import json
import sys

if __name__ == '__main__':
    addr = 'http://localhost:5000'
    if (len(sys.argv) == 2):
        img = cv2.imread(sys.argv[1])
        content_type = 'image/jpeg'
        headers = {'content-type': content_type}
        try:
            _, img_encoded = cv2.imencode('.jpg', img)
            response = requests.post(addr,
                                     data=img_encoded.tobytes(),
                                     headers=headers)
            print("Received")
        except:
            print("Not a valid image")
    else:
        print("Usage: ./send_img.py <path to image>")