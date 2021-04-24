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
    print(obj_detect(cv2.imread(sys.argv[1])))
