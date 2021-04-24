#!/usr/bin/python3
"""Main file to test "obj_det" function.

Usage:
    Execute like this:
    "./main <path to image>"
"""
from objdet import obj_detect
import cv2
import sys

if __name__ == "__main__":
    img = cv2.imread(sys.argv[1])
    print(obj_detect(img))
