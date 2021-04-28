<p align="center">
<img align="center" alt="GIF" src="https://raw.githubusercontent.com/Alejandra2254/holbertonschool-low_level_programming/master/logo.gif"/>
</p>

<h3 align="center">Hi there 👋, we are Seedtech, a great group of developers </h3>
<h4 align="center"> Thanks to being here to see our first group application </h4>

## About this repo 

The purpose of this repository is to show an elaboration, adaptation and expansion of code carried out in **2** days by the work team under the premise of making an estimate for the capstone project presented, without having previous knowledge in Flutter, to teach them our skills, dexterity and commitment . We want them and we will try our best to get it. 

<h1 align="center"> Seedtech - What do i see? </h1>
What do i see application is made for detection of around 80 common default objects based on a photo or image uploaded to the backend of the app. when detecting the elements the application will output the name of the element and the times number it finds the element in the image.

# How it works 

The backend of the application uses the cvlib library, (as long as the openCV, tensorflow packages are installed) after loading the image, the detection of objects is carried out with the call of the function detect_common_objects (). This returns Bbox (minimum bounding box), conf (confidence) and a label as a list of all the elements detected, which it uses to create a dictionary that has as a key the name of the element found and the value of the number of times it was found.

# Technologies 
* python3.5
* pip
* numpy
* OpenCV
* Tensorflow
* Flutter
* Fast - api / Uvicorn, library as server to run fast api.
* azure-storage-blob

## Table of contents
| Foulder/File | Description  |
|--|--|
| backend | Package, handles the functionality of the application |
| [api](https://github.com/Seed-Tech/what_do_i_see/tree/backend/api)/init_fast.py | Handles the creation of the api, receives an image, decodes it to image format to be able to send it the obj_detect() function.  |
| [api](https://github.com/Seed-Tech/what_do_i_see/tree/backend/api)/objdetwith_blob.py |  Function obj_detect (): through the opencv library handles the AI, allowing to identify and process the image. the function builds a dictionary with labels, which describes the detected objects and a bbox (with bbox, labels and conf of the each image), assigns a name to it. Function send_to_blob (): this module manages blob as well, to save the output.  |
| [api](https://github.com/Seed-Tech/what_do_i_see/tree/backend/api)/Dockerfile |  Commands file or instructions to create a dockable image with the application |
| [api](https://github.com/Seed-Tech/what_do_i_see/tree/backend/api)/[Blob_upload](https://github.com/Seed-Tech/what_do_i_see/tree/backend/api/Blob_upload)/upload.py |  Handle the upload data to azure Blob storage. |
| modelsapp | Toolkit and files created with flutter for the development of the frontend of our application|
