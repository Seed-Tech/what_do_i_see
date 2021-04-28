import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class Model extends StatefulWidget {
  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Model> {
  final picker = ImagePicker();
  bool _loading = true;
  String resultText = "Fetching Response...";
  String _path;
  String _image64;
  //Uint8List _bytes;
  File _image;

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);

    if (image == null) return null;

    setState(() {
      _path = image.path;
      _image = File(image.path);
      _loading = false;
    });

    List bytes = new File(_path).readAsBytesSync();
    _image64 = base64.encode(bytes);
    var response = await postDataImage(_image64);
    var content = json.decode(response.body);
    parseResponse(content);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    if (image == null) return null;

    setState(() {
      _path = image.path;
      _image = File(image.path);
      _loading = false;
    });

    List bytes = new File(_path).readAsBytesSync();
    _image64 = base64.encode(bytes);
    var response = await postDataImage(_image64);
    var content = json.decode(response.body);
    parseResponse(content);
  }

  Future postDataImage(_data) async {
    return await http.post(
      Uri.http("104.214.57.104:8000", "/"),
      body: jsonEncode(_data),
    );
  }

  void parseResponse(var response) {
    String r = "";

    resultText = r;
    //_bytes = base64Decode(response['img']);
    //response.remove('img');
    response.forEach((k, v) => r = r + '$k: $v \n');
    print(r);
    setState(() {
      resultText = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(20, 220, 192, 1.0),
                Color.fromRGBO(142, 135, 202, 1.0),
                Color.fromRGBO(206, 96, 207, 1.0)
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 98),
                // Text(
                //   'Text Generator',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 35,
                //   ),
                // ),
                // Text(
                //   'Image to text Generator',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 80),
                Container(
                    // height: MediaQuery.of(context).size.height - 250,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: _loading
                              ? Container(
                                  // width: 500,
                                  // height: 8,
                                  child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Object detection',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                      ),
                                    ),
                                    Text(
                                      'using YOLO',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      width: 150,
                                      child: Image.asset(
                                        'assets/focus.png',
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: pickGalleryImage,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  180,
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24, vertical: 17),
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Text(
                                                'Camera Roll',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: pickImage,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  180,
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24, vertical: 17),
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Text(
                                                'Take a Photo',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                              : Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        height: 300,
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 22,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color.fromRGBO(
                                                            20, 220, 192, 1.0),
                                                        Color.fromRGBO(
                                                            142, 135, 202, 1.0),
                                                        Color.fromRGBO(
                                                            206, 96, 207, 1.0)
                                                      ],
                                                    ),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _loading = true;
                                                        resultText =
                                                            "Fetching Response...";
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.arrow_back_ios,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'RESULT',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'ZenDots',
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  250,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.file(_image,
                                                    fit: BoxFit.scaleDown),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        child: Text(
                                          '$resultText',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
