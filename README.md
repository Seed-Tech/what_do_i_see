# what_do_i_see
<p align="center">
<img align="center" alt="GIF" src="https://raw.githubusercontent.com/Alejandra2254/holbertonschool-low_level_programming/master/logo.gif"/>
</p>

<h3 align="center">Hi there 👋, we are Seedtech, a great group of developers </h3>
<h4 align="center"> Thanks to being here to see our first group application </h4>

## About this repo 

The purpose of this repository is to show an elaboration, adaptation and expansion of code carried out in **4** days by the work team under the premise of making an estimate for the capstone project presented, without having previous knowledge in Flutter, to teach them our skills, dexterity and commitment . We want them and we will try our best to get it. 

<h1 align="center"> Seedtech - What do i see? </h1>
What do i see is an application made for detection of around 80 common default objects based on a photo or image uploaded to the backend of the app. when detecting the elements the application will output the name of the element and the times number it finds the element in the image.

## How it works 

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

## Blueprint design

<img  align="right"  alt="GIF" width="250"  src="https://raw.githubusercontent.com/Seed-Tech/what_do_i_see/master/Blueprint_initialdesign.png"/>
</p>

The initial design of our application has a base design (see the image on the repo):
* The background is a color gradient from blue to purple.
* The containers and boxes in white.
* the color of the letter can be white or black.
* and all except the main scrren will have a return button.
* 
we also have six initial sketches: 

| Screen  | Functionality |
|--|--|
| 1. Home  | Starts the application, options to choose to log in or register |
| 2. Register | Seleccion register, this contains fields for registration. |
| 3. Select model | After registration or direct entry, model selection screen with two buttons. |
| 4. Detection model | Seleccion model detection, this screen is connected to the api and has a box to view the image and two buttons according to the selection (roll camera and take a photo) |
| 5. Second model | Is a selection model that we made thanks to the Udemy course, Deep Learning Course with Flutter & Python |
| 6. Search | This screen is a prototype to the elastic search functionality. |

## Work Flow

### Simplified flow chart

<img  align="left"  alt="GIF" width="380" src="https://github.com/Seed-Tech/what_do_i_see/blob/main/Flow.jpg"/>
</p>

The information/data are generated from the mobile device. For this first prototype, the process of logging in or registering is not enabled to collect, with information/data refers to the image that the user can photograph or take from their gallery. This image will be decoded and sent by http to an ubuntu server in docker manipulated by fast-api, which will redirect the decoded image to a machine learning algorithm implemented with python, tensorflow and opencv, in charge of encoding the image and identifying and pointing to the objects of the photograph received. The image is uploaded to another server for unstructured data in Microsoft Azure of blob type, decoded again and sent back by http in a dictionary with the types and quantity of objects detected to the user in the app made in flutter.

