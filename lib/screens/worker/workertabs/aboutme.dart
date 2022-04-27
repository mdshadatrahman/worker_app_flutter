import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/screens/MainHome/user_profile_tabs/editprofile.dart';
import 'package:worker_app/utils/Colors.dart';

class aboutme_worker extends StatefulWidget {
  @override
  _aboutme_workerState createState() => _aboutme_workerState();
}

class _aboutme_workerState extends State<aboutme_worker> {
  bool isopen=false;
  @override
  Widget build(BuildContext context) {var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
  return SafeArea(child: Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Text('About me',style: TextStyle(fontSize: 18),)
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Row(
                children: [
                  Text('Audio',style: TextStyle(fontSize: 18),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AudioWave(
                      height: 32,
                      width: 88,
                      spacing: 2.5,
                      bars: [
                        AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
                        AudioWaveBar(height: 30, color: Colors.blue),
                        AudioWaveBar(height: 70, color: Colors.black),
                        AudioWaveBar(height: 40),
                        AudioWaveBar(height: 20, color: Colors.orange),
                        AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
                        AudioWaveBar(height: 30, color: Colors.blue),
                        AudioWaveBar(height: 70, color: Colors.black),
                        AudioWaveBar(height: 40),
                        AudioWaveBar(height: 20, color: Colors.orange),
                        AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
                        AudioWaveBar(height: 30, color: Colors.blue),
                        AudioWaveBar(height: 70, color: Colors.black),
                        AudioWaveBar(height: 40),
                        AudioWaveBar(height: 20, color: Colors.orange),
                        AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
                        AudioWaveBar(height: 30, color: Colors.blue),
                        AudioWaveBar(height: 70, color: Colors.black),
                        AudioWaveBar(height: 40),
                        AudioWaveBar(height: 20, color: Colors.orange),
                      ],
                    ),
                  ),                  ],
              )
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height/4,width:width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage('assets/images/drive.jpeg'))
              ),child: Container(

              child: Center(
                child: Icon(Icons.play_arrow,color: AppColors.primary,size: 50,),
              ),
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Text('Working Experience',style: TextStyle(fontSize: 18),)
            ],),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  // Get.to(() =>  driver_list(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                  //     transition: Transition.leftToRight );
                  isopen==false? setState(() {
                    isopen=true;
                  }):setState(() {
                    isopen=false;
                  });

                },
                child: Container(
                  height: height/18,
                  width:width/3,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/images/1.jpeg'),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Driving',style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18
                      ),),
                    ),Icon(isopen==false?Icons.arrow_drop_down:Icons.arrow_drop_up_sharp,color: Colors.white,)
                  ],
                ),
                ),
              ),
            ),

          ),
          isopen==false?Container():
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Platz   :",style: TextStyle(color: Colors.grey,fontSize: 14),),
                    Text("1+ years exp ",style: TextStyle(color: AppColors.primary,fontSize: 14),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Vezel   :",style: TextStyle(color: Colors.grey,fontSize: 14),),
                    Text("1+ years exp ",style: TextStyle(color: AppColors.primary,fontSize: 14),),
                  ],
                ),                  SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Volvo   :",style: TextStyle(color: Colors.grey,fontSize: 14),),
                    Text("1+ years exp ",style: TextStyle(color: AppColors.primary,fontSize: 14),),
                  ],
                ),                  SizedBox(height: 10,),
                Row(
                  children: [
                    Text("BMW   :",style: TextStyle(color: Colors.grey,fontSize: 14),),
                    Text("1+ years exp ",style: TextStyle(color: AppColors.primary,fontSize: 14),),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                Get.to(() =>  edit_profile(), duration: const Duration(milliseconds: 500), //duration of transitions, default 1 sec
                    transition: Transition.zoom );},
              child  : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height/25,

                  width: width/4.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary                  ),child: Center(
                  child: Text('Edit Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                ),
              ),
            ),
          ),

        ],
      ),
    ),
  ));
  }
}
