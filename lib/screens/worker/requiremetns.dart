import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:worker_app/screens/MainHome/settigns.dart';import 'package:get/route_manager.dart';
import 'package:worker_app/screens/worker/workflow_video.dart';

import 'package:worker_app/utils/Colors.dart';
class requirements extends StatefulWidget {
  @override
  _requirementsState createState() => _requirementsState();
}

class _requirementsState extends State<requirements> {
  ImagePicker picker = ImagePicker();
  var _image,Image2,image3;

  Future takephoto_camera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path);
    });
    //return image;
  }
  Future takephoto_gallary() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
    //return image;
  }
  @override
  Widget build(BuildContext context) { var heigth = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: heigth/7,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DottedBorder(  color: Colors.black,
                strokeWidth: 1,
                child: Container(
                  height: heigth/2,
                  width: width,
                  decoration: BoxDecoration(


                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child : InkWell(
                              onTap:(){
                                takephoto_camera();
                              },
                              child: Container(
                                height: heigth/18,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300]

                                ),
                                child: Center(child: Text('Take a picture',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap:(){
                                takephoto_gallary();
                              },
                              child: Container(
                                height: heigth/18,

                                decoration: BoxDecoration(
                                    color:AppColors.primary

                                ),
                                child: Center(child: Text('Upload a photo',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),)),
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(child: Container(
                        height: heigth/2.2,
                        width: width,
                        child: _image != null
                            ? Column(
                          children: [
                        Image.file(
                        _image,
                          height: heigth/2.3,


                        )]):Column(
                          children: [
                            SizedBox(height: heigth/6,),
                            Container(
                              height: 100,width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,border:Border.all(color: Colors.grey)
                              ),child: IconButton(icon: Icon(Icons.camera_alt,color: AppColors.primary,),onPressed: (){},),
                            )
                          ],
                        )
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Get.to(() =>  workflow(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                      transition: Transition.leftToRight );
                },
                child: Container(decoration: BoxDecoration(
                  color: AppColors.primary,borderRadius: BorderRadius.circular(5)
                ),child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),),
              ),
            )
          ],
        ),
      ),

    ));
  }
}
