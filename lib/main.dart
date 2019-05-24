import 'dart:io';
import  'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(App());

class App extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp()
    );
  }

}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _MyAppState();

}

class _MyAppState extends State<MyApp> {

  File _image;
  List _recognitions;
  double _imageHeight;
  double _imageWidth;
  bool _busy = false;

  Future predictImagePicker() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _busy = true;
    });
    //predictImage(image);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackChildren = [];
    return Scaffold(
        appBar: AppBar(
        title: const Text('tflite example app'),
        ),
      body: Stack(
        children: stackChildren,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: predictImagePicker,
        tooltip: 'Pick Image',
        child: Icon(Icons.image),
      ),
    );
  }
}