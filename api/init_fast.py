#!/usr/bin/python3
"""This module inits a server using fastAPI , to
send directory through http. NAOAPI uses cvlib, that uses
YOLO V3 to perform object detection on images.

Usage:
    Execute it like this to start server:
    "uvicorn init_fast:app"
    Send encoded bytes of image as body of a GET or TOP
    request to "localhost:8000", receive dictionary of results
    as response.
"""
from fastapi import FastAPI, Request
from objdetwith_blob import obj_detect
import base64
import numpy as np
import cv2
import sys

app = FastAPI()

@app.get('/')
@app.post('/')
async def main(request: Request):
    """Receive image and return dictionary of image proccessed
    
    Args:
        request(Request): file from request
    
    Return:
        Dictionary of results or null if model cannot
        proccess the image"""
    data = await request.body()
    data = base64.b64decode(data)
    try:
        img_arr = np.frombuffer(data, dtype=np.uint8)
        img = cv2.imdecode(img_arr, flags=cv2.IMREAD_COLOR)
        result = obj_detect(img)
        for key, value in result.items():
            #if key != 'img':
            print("label: {}, value: {}".format(key, value))
        return(result)
    except:
        return ({})
