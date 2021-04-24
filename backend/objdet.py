#!/usr/bin/python3
"""This module proccesses an image through YOLO V3 model
using cvlib API and stores and print its output.

Usage:
    Function "obj_detect" accepts one argument, call this module like this:
    "obj_detect(<img object>)"
"""

import cvlib as cv
from cvlib.object_detection import draw_bbox
import cv2


def obj_detect(img):
    """Function to proccess an image through cvlib API.

    Args:
        img (numpy.ndarray) = Array of image to proccess.

    Return:
        Dictionary of results.
    """
    print(type(img))
    result = {}
    # Apply object detection
    bbox, labels, conf = cv.detect_common_objects(img, confidence=0.30)
    # Create results dictionary.
    for element in labels:
        result[element] = labels.count(element)
    # Draw bounding box over detected objects
    out = draw_bbox(img, bbox, labels, conf)
    # Save output
    cv2.imwrite("object_detection.jpg", out)
    return(result)
