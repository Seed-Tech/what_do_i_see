#!/usr/bin/python3
"""This module inits a localhost server using flask, to
send directory through http.

Usage:
    Execute it like this:
    "python3 init_flask.py"
"""
from flask import Flask, request
from objdet import obj_detect
# import base64
import numpy as np
import cv2
import sys


app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def main():
    """Receive image and return dictionary of image proccessed"""
    # img_data = base64.b64decode(request.data)
    img_arr = np.frombuffer(request.data, dtype=np.uint8)
    try:
        img = cv2.imdecode(img_arr, flags=cv2.IMREAD_COLOR)
        result = obj_detect(img)
        print(result)
        return(result)
    except:
        return({})


if __name__ == '__main__':
    app.run(debug=True)
