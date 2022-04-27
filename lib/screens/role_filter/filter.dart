import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/utils/Colors.dart';

import 'driver_list.dart';
class filter extends StatefulWidget {
  @override
  _filterState createState() => _filterState();
}

class _filterState extends State<filter> {
  var location_value=0.0;
  var experience_value=.5;
  var suv=.5;
  var saloon=.5;
  var minivan=.5;
  var sports=.5;
  var truck=.5;
  List driver=[{
    "experience":.3,
    'saloon':.2,
    'suv':.5,
    'sports_car':.7,
    'minivan':.2,
    'truck':.3,
  },{
    "experience":.6,
    'saloon':.6,
    'suv':.6,
    'sports_car':.6,
    'minivan':.6,
    'truck':.6,
  },{
    "experience":1,
    'saloon':1,
    'suv':1,
    'sports_car':1,
    'minivan':1,
    'truck':1,
  },];
  bool sallon=false;
  bool suuv=false;
  bool sp_car=false;
  bool mini=false;
  bool trucko=false;


  bool basic=false;
  bool advance=false;
  bool premium=false;
  @override
  Widget build(BuildContext context) {var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        centerTitle: true,elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: AppColors.primary,),),
      ),
body: SingleChildScrollView(
  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: height/45,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Location",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 80),
        child: LinearProgressIndicator(
          color: AppColors.linear1,
          value: .2,
          backgroundColor: Colors.blueGrey,
        ),
      ),
      SizedBox(height: height/20,),Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Driver Experience Level",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
      ), SizedBox(height: height/30,),
      Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 80),
        child: LinearProgressIndicator(
          color: AppColors.linear1,
          value: experience_value,
          backgroundColor: Colors.blueGrey,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          basic=true;
                          advance=false;
                          premium=false;
                          experience_value=.3;
                          saloon=.3;
                          suv=.7;
                          sports=.4;
                          minivan=.8;
                          truck=.7;

                        });
                        // Get.to(() =>  filter(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                        //     transition: Transition.leftToRight );
                      },
                      child: Container(
                        height: height/9,
                        width: width/3,
                        decoration: BoxDecoration(
                            color: AppColors.light,
                            border: Border.all(color: basic==true && advance==false && premium==false?AppColors.primary:Colors.white),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(height: height/45,),
                              Image.asset('assets/images/1.jpeg',height: height/12,width: width/3,),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text("Basic",style: TextStyle(
                          color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14
                      ),),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          basic=false;
                          advance=true;
                          premium=false;
                          experience_value=.5;
                          saloon=.5;
                          suv=.6;
                          sports=.7;
                          minivan=.8;
                          truck=.9;
                        });
                        // Get.to(() =>  filter(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                        //     transition: Transition.leftToRight );
                      },
                      child: Container(
                        height: height/9,
                        width: width/3,
                        decoration: BoxDecoration(
                            color: AppColors.light,
                            border: Border.all(color: basic==false && advance==true && premium==false?AppColors.primary:Colors.white),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(height: height/45,),
                              Image.asset('assets/images/1.jpeg',height: height/12,width: width/3,),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text("Advance",style: TextStyle(
                          color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14
                      ),),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          basic=false;
                          advance=false;
                          premium=true;
                          experience_value=1.0;
                          saloon=1.0;
                          suv=1.0;
                          sports=1.0;
                          minivan=1.0;
                          truck=1.0;
                        });
                        // Get.to(() =>  filter(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                        //     transition: Transition.leftToRight );
                      },
                      child: Container(
                        height: height/9,
                        width: width/3,
                        decoration: BoxDecoration(
                            color: AppColors.light,
                            border: Border.all(color: basic==false && advance==false && premium==true?AppColors.primary:Colors.white),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(height: height/45,),
                              Image.asset('assets/images/1.jpeg',height: height/12,width: width/3,),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text("Premium",style: TextStyle(
                          color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14
                      ),),
                    ),
                  ],
                ),
              ),
            ),


          ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/images/c1.jpeg',height: 60,width: 60,),
            Container(
              width: width/1.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Saloon",style: TextStyle(fontWeight: FontWeight.bold),),
                    LinearProgressIndicator(
                      color: AppColors.primary,
                      value: saloon,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 10,),
                    sallon==true? Text('1 year + experience ',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),):Container()
                  ],
                ),
              ),
            ), InkWell(
              onTap: (){

                sallon==false?  setState(() {
                  sallon=true;
                }) : setState(() {
                  sallon=false;
                });
              },
              child : CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 15,
                child: Icon(sallon==false?Icons.arrow_downward_outlined:Icons.arrow_upward_outlined,color: Colors.white,),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/images/c2.jpeg',height: 60,width: 60,),
            Container(
              width: width/1.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SUV",style: TextStyle(fontWeight: FontWeight.bold),),
                    LinearProgressIndicator(
                      color: AppColors.primary,
                      value: suv,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 10,),
                    suuv==true? Text('2 year + experience ',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),):Container()
                  ],
                ),
              ),
            ), InkWell(
              onTap: (){

                suuv==false?  setState(() {
                  suuv=true;
                }) : setState(() {
                  suuv=false;
                });
              },
              child : CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 15,
                child: Icon(suuv==false?Icons.arrow_downward_outlined:Icons.arrow_upward_outlined,color: Colors.white,),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/images/c3.jpeg',height: 60,width: 60,),
            Container(
              width: width/1.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sports card",style: TextStyle(fontWeight: FontWeight.bold),),
                    LinearProgressIndicator(
                      color: AppColors.primary,
                      value: sports,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 10,),
                    sp_car==true? Text('2 year + experience ',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),):Container()
                  ],
                ),
              ),
            ), InkWell(
              onTap: (){

                sp_car==false?  setState(() {
                  sp_car=true;
                }) : setState(() {
                  sp_car=false;
                });
              },
              child : CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 15,
                child: Icon(sp_car==false?Icons.arrow_downward_outlined:Icons.arrow_upward_outlined,color: Colors.white,),
              ),
            )
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/images/c4.jpeg',height: 60,width: 60,),
            Container(
              width: width/1.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mini Van",style: TextStyle(fontWeight: FontWeight.bold),),
                    LinearProgressIndicator(
                      color: AppColors.primary,
                      value: minivan,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 10,),
                    mini==true? Text('2 year + experience ',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),):Container()
                  ],
                ),
              ),
            ), InkWell(
              onTap: (){

                mini==false?  setState(() {
                  mini=true;
                }) : setState(() {
                  mini=false;
                });
              },
              child : CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 15,
                child: Icon(mini==false?Icons.arrow_downward_outlined:Icons.arrow_upward_outlined,color: Colors.white,),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/images/5.jpeg',height: 60,width: 60,),
            Container(
              width: width/1.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Truck",style: TextStyle(fontWeight: FontWeight.bold),),
                    LinearProgressIndicator(
                      color: AppColors.primary,
                      value: truck,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 10,),
                    trucko==true? Text('2 year + experience ',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),):Container()
                  ],
                ),
              ),
            ), InkWell(
              onTap: (){

                trucko==false?  setState(() {
                  trucko=true;
                }) : setState(() {
                  trucko=false;
                });
              },
              child : CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 15,
                child: Icon(trucko==false?Icons.arrow_downward_outlined:Icons.arrow_upward_outlined,color: Colors.white,),
              ),
            )
          ],
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Get.to(() =>  driver_list(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                  transition: Transition.leftToRight );
            },
            child: Container(
              height: height/18,
              width:width/3,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Next',style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18
                ),),Icon(Icons.arrow_right_rounded,color: Colors.white,)
              ],
            ),
            ),
          ),
        ),

      )
    ],
  ),
),
    ));
  }
}
