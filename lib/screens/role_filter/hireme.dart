import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/screens/MainHome/mainHome.dart';
import 'package:worker_app/screens/help.dart';
import 'package:worker_app/utils/Colors.dart';
class hireme extends StatefulWidget {
  @override
  _hiremeState createState() => _hiremeState();
}

class _hiremeState extends State<hireme> {
  @override
  Widget build(BuildContext context) {  var heigth = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
backgroundColor: AppColors.bg2,
      appBar: AppBar(


        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Hire me',style: TextStyle(color: Colors.black,fontSize: 18),),
        leading: Icon(Icons.arrow_back,color: AppColors.primary,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/p1.jpg'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Job Title",style: TextStyle(
                color: Colors.grey,fontSize: 16
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: heigth/18,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Driver",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
            ), Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Vehicle Type",style: TextStyle(
                color: Colors.grey,fontSize: 16
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: heigth/18,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Mqarcedes Benz",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Catagory",style: TextStyle(
                  color: Colors.grey,fontSize: 16
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: heigth/18,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Driver Service",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Employment Type",style: TextStyle(
                  color: AppColors.primary,fontSize: 16
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (b)=>null,checkColor: Colors.white,fillColor: MaterialStateProperty.all(AppColors.primary),),
                      Text("Full Time",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),)
                    ],
                  ),  Row(
                    children: [
                      Checkbox(value: false, onChanged: (b)=>null,checkColor: Colors.white,fillColor: MaterialStateProperty.all(AppColors.primary),),
                      Text("Part Time",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),)
                    ],
                  ),  Row(
                    children: [
                      Checkbox(value: false, onChanged: (b)=>null,checkColor: Colors.white,fillColor: MaterialStateProperty.all(AppColors.primary),),
                      Text("Contract ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),)
                    ],
                  ),
                ],
              ),
            ), Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Payment Type",style: TextStyle(
                  color: AppColors.primary,fontSize: 16
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (b)=>null,checkColor: Colors.white,fillColor: MaterialStateProperty.all(AppColors.primary),),
                      Text("Salary",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),)
                    ],
                  ),  Row(
                    children: [
                      Checkbox(value: false, onChanged: (b)=>null,checkColor: Colors.white,fillColor: MaterialStateProperty.all(AppColors.primary),),
                      Text("Fixed",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),)
                    ],
                  ),  Row(
                    children: [
                      Checkbox(value: false, onChanged: (b)=>null,checkColor: Colors.white,fillColor: MaterialStateProperty.all(AppColors.primary),),
                      Text("Hourly ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),)
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  Get.to(() =>  MainHome(), duration: const Duration(milliseconds: 500), //duration of transitions, default 1 sec
                      transition: Transition.leftToRight );},
                child  : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: heigth/25,

                    width: width/4.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary                  ),child: Center(
                    child: Text('Hire me',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
