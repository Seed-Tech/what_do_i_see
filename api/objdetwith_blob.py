#!/usr/bin/python3
"""This module proccesses an image through YOLO V3 model
using cvlib library and stores and print its output.

Usage:
    Function "obj_detect" accepts one argument, call this module like this:
    "obj_detect(<img object>)"
"""
from Blob_upload.upload import upload, get_files
from uuid import uuid4
import cvlib as cv
from cvlib.object_detection import draw_bbox
import cv2
import base64
import os

def obj_detect(img):
    """Function to proccess an image through cvlib API.

    Args:
        img (numpy.ndarray) = Array of image to proccess.

    Return:
        Dictionary of results.
    """
    name = str(uuid4())
    result = {}
    # Apply object detection
    bbox, labels, conf = cv.detect_common_objects(img, confidence=0.40)
    # Create results dictionary.
    for element in labels:
        result[element] = labels.count(element)
    # Draw bounding box over detected objects
    out = draw_bbox(img, bbox, labels, conf)
    img_data = base64.b64encode(out)
    #_, img_encoded = cv2.imencode('.jpg', out)
    #result['img'] = img_data
    try:
        os.mkdir('image/')
    except FileExistsError as error:
        pass
    # Save output
    archive_name = "image/" + name + ".jpg"
    cv2.imwrite(archive_name, out)
    # Function to save img in blob storage
    send_to_blob()
    return(result)

def send_to_blob():
    """ Upload file to blob """
    images = get_files('image/')
    upload(images)
