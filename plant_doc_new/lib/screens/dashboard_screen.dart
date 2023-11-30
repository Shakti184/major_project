import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

import 'drawer_screen.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {

    
  File ?_image;
  final picker = ImagePicker();

  Future getImageFromGallery()async{
    final pickedFile = await picker.pickImage(source:ImageSource.gallery);
    setState(() {
      if(pickedFile!=null){
        _image=File(pickedFile.path);
      }
    }); 
  }

  Future getImageFromCamera()async{
    final pickedFile = await picker.pickImage(source:ImageSource.camera);
    setState(() {
      if(pickedFile!=null){
        _image=File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Plant Doc',
            style: TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        drawer: const Navigationdrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 0, 21, 11),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Card(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Chat bot will be added soon',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: const Icon(
            Icons.chat_bubble_rounded,
            size: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo, width: 5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Card(
                        child: _image != null
                            ? Image.file(
                                _image!,
                                width: 570,
                                height: 270,
                                fit: BoxFit.scaleDown,
                              )
                            : Image.network(
                                'https://mcdn.wallpapersafari.com/medium/3/88/9tOhN2.jpg',
                                width: 570,
                                height: 270,
                                fit: BoxFit.scaleDown,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 5,
                      child: IconButton(
                        onPressed: showOptions,
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    onPressed: showOptions,
                    icon: const Icon(Icons.add_a_photo_sharp),
                    label: const Text('UPLOAD IMAGE')),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    onPressed: (){},
                    icon: const Icon(Icons.data_thresholding),
                    label: const Text('Run Test')),
              ),
            ],
          ),
          ),
    );
  }
}