import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/screens/worker/requiremetns.dart';
import 'package:worker_app/utils/Colors.dart';
class catagory extends StatefulWidget {
  @override
  State<catagory> createState() => _catagoryState();
}

class _catagoryState extends State<catagory> {
  bool step1=false;
  @override
  Widget build(BuildContext context) { var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
       body: SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(height: height/30,),
             Center(child: Text('Category',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
             SizedBox(height: height/15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: [
                         InkWell(
                           onTap: (){
                             Get.to(() =>  requirements(), duration: const Duration(milliseconds: 500), //duration of transitions, default 1 sec
                                 transition: Transition.zoom );
                           },
                           child: Container(
                             height: height/7,
                             width: width/2.8,
                             decoration: BoxDecoration(
                                 color: AppColors.light,
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
                           child: Text("Driver",style: TextStyle(
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
                             Get.to(() =>  requirements(), duration: const Duration(milliseconds: 500), //duration of transitions, default 1 sec
                                 transition: Transition.zoom );
                           },
                           child: Container(
                             height: height/7,
                             width: width/2.8,
                             decoration: BoxDecoration(
                                 color: AppColors.light,
                                 borderRadius: BorderRadius.circular(8)

                             ),
                             child: Center(
                               child: Column(
                                 children: [
                                   SizedBox(height: height/45,),
                                   Image.asset('assets/images/2.jpeg',height: height/12,width: width/3,),

                                 ],
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(1.0),
                           child: Text("Cook",style: TextStyle(
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
                             Get.to(() =>  requirements(), duration: const Duration(milliseconds: 500), //duration of transitions, default 1 sec
                                 transition: Transition.zoom );
                           },
                           child: Container(
                             height: height/7,
                             width: width/2.8,
                             decoration: BoxDecoration(
                                 color: AppColors.light,
                                 borderRadius: BorderRadius.circular(8)
                             ),
                             child: Center(
                               child: Column(
                                 children: [
                                   SizedBox(height: height/45,),
                                   Image.asset('assets/images/3.jpeg',height: height/12,width: width/3,),

                                 ],
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(1.0),
                           child: Text("Electrician",style: TextStyle(
                               color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14
                           ),),
                         ),
                       ],
                     ),
                   ),
                 ),

               ],),
             SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: [
                         InkWell(
                           onTap: (){
                             Get.to(() =>  requirements(), duration: const Duration(milliseconds: 500), //duration of transitions, default 1 sec
                                 transition: Transition.zoom );
                           },
                           child: Container(
                             height: height/7,
                             width: width/2.8,
                             decoration: BoxDecoration(
                                 color: AppColors.light,
                                 borderRadius: BorderRadius.circular(8)
                             ),
                             child: Center(
                               child: Column(
                                 children: [
                                   SizedBox(height: height/45,),
                                   Image.asset('assets/images/4.jpeg',height: height/12,width: width/3,),

                                 ],
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(1.0),
                           child: Text("Cleaner",style: TextStyle(
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
                             Get.to(() =>  requirements(), duration: const Duration(milliseconds: 500), //duration of transitions, default 1 sec
                                 transition: Transition.zoom );
                           },
                           child: Container(
                             height: height/7,
                             width: width/2.8,
                             decoration: BoxDecoration(
                                 color: AppColors.light,
                                 borderRadius: BorderRadius.circular(8)
                             ),
                             child: Center(
                               child: Column(
                                 children: [
                                   SizedBox(height: height/45,),
                                   Image.asset('assets/images/5.jpeg',height: height/12,width: width/3,),

                                 ],
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(1.0),
                           child: Text("Gardener",style: TextStyle(
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
                         InkWell(  onTap: (){
                           Get.to(() =>  requirements(), duration: const Duration(milliseconds: 500), //duration of transitions, default 1 sec
                               transition: Transition.zoom );
                         },
                           child: Container(
                             height: height/7,
                             width: width/2.8,
                             decoration: BoxDecoration(
                                 color: AppColors.light,
                                 borderRadius: BorderRadius.circular(8)
                             ),
                             child: Center(
                               child: Column(
                                 children: [
                                   SizedBox(height: height/45,),
                                   Image.asset('assets/images/6.jpeg',height: height/12,width: width/3,),

                                 ],
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(1.0),
                           child: Text("Plumber",style: TextStyle(
                               color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14
                           ),),
                         ),
                       ],
                     ),
                   ),
                 ),

               ],),

           ],
         ),
       ),
    ));
  }
}
