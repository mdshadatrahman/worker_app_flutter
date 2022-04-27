import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/screens/MainHome/user_profile_tabs/editprofile.dart';
import 'package:worker_app/utils/Colors.dart';

import '../mainHome.dart';
class aboutme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child:             Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.location_pin,color: AppColors.primary,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Male'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.call,color: AppColors.primary,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('+88016147856'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.location_pin,color: AppColors.primary,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Philadelphia , Washinton DC'),
                    )
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
      ),
    ));
  }
}
