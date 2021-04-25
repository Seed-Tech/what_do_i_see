#!/usr/bin/python3
"""This module inits a localhost server using flask, to
send directory through http.

Usage:
    Execute it like this:
    "python3 init_flask.py <path to image>"
"""
from flask import Flask
from objdet import obj_detect
import cv2
import sys


app = Flask(__name__)


@app.route('/')
def main():
    """Return dictionary of image proccessed"""
    return(obj_detect(cv2.imread(sys.argv[1])))

if __name__ == '__main__':
    app.run(debug=True)
