#!/usr/bin/python3
"""This module proccesses an image through YOLO V3 model
using cvlib API and stores and print its output.

Usage:
    Accepts one argument, execute this module like this:
    "./main.py <path to image>"
"""

import cvlib as cv
from cvlib.object_detection import draw_bbox
import sys
import cv2

if __name__ == "__main__":
    result = {}
    # Read input image
    img = cv2.imread(sys.argv[1])
    # Apply object detection
    bbox, labels, conf = cv.detect_common_objects(img)
    # Create results dictionary.
    for element in labels:
        result[element] = labels.count(element)
    print(result)
    # draw bounding box over detected objects
    out = draw_bbox(image, bbox, labels, conf)
    # Save output
    cv2.imwrite("object_detection.jpg", out)
