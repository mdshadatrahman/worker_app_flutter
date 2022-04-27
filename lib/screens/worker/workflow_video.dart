import 'package:flutter/material.dart';
import 'package:worker_app/screens/worker/worker_profile.dart';
import 'package:worker_app/utils/Colors.dart';import 'package:get/route_manager.dart';

class workflow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height/30,),
            Center(child: Text('Driver',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
            SizedBox(height: height/35         ,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: height / 1.5,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.1)),
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
  onTap: (){
  Get.to(() =>  worker_profile(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
  transition: Transition.zoom );},
                  child: Container(
                    height: height / 22,
                    width: width / 4,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(8),
                        color: AppColors.primary),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(
                          "Skip",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
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
