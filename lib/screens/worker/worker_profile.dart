import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/screens/MainHome/mainHome.dart';
import 'package:worker_app/screens/auth/login.dart';
import 'package:worker_app/screens/role_filter/profile_tabs/reviews.dart';

import 'package:worker_app/screens/worker/workertabs/aboutme.dart';
import 'package:worker_app/screens/worker/workertabs/worklist.dart';
import 'package:worker_app/utils/Colors.dart';


class worker_profile extends StatefulWidget {
  @override
  _worker_profileState createState() => _worker_profileState();
}

class _worker_profileState extends State<worker_profile> with SingleTickerProviderStateMixin{
  TabController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 3, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
  return WillPopScope(
    onWillPop: ()async{
      Get.to(()=>MainHome());
      return true;
    },
    child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back,color: Colors.transparent,),),
            title: Text('Profile',style: TextStyle(color: Colors.black),),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Get.to(()=>login_screen());
                  },
                  child: Container(
                    height:height/18 ,
                    width: width/6,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),

                    ),child: Center(child: Text("Logout")),
                  ),
                ),
              )
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircularProfileAvatar(
                        '',
                        child: Image.asset('assets/images/p1.jpg',fit: BoxFit.cover,),
                        borderColor: AppColors.primary,
                        borderWidth: 2,
                        elevation: 2,
                        radius: 60,
                      ),                          SizedBox(width: 25,),

                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Claire Vex ,',style: TextStyle(color: Colors.black,fontSize:18 ),),
                              Text('25 ( 5years exp),',style: TextStyle(color: Colors.black,fontSize:14 ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.location_pin,color: AppColors.primary,),
                              Text("Philipedia , Washington DC",style: TextStyle(color: AppColors.primary,fontSize: 12,fontWeight: FontWeight.w600),),
                            ],
                          ),                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Icon(Icons.star,color:Colors.yellow),
                              Text(' 4.9    (200 reviews')
                            ],
                          ) ,                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.person_pin_rounded,color:AppColors.care),
                              Text(' Cared for 200 families')
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                // Align(
                //   alignment: Alignment.center,
                //   child: InkWell(
                //     onTap: (){
                //       Get.to(() =>  hireme(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                //           transition: Transition.leftToRight );},
                //     child  : Container(
                //       height: height/25,
                //
                //       width: width/4.4,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           border: Border.all(color: AppColors.primary)
                //       ),child: Center(
                //       child: Text('Hire me'),
                //     ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 25,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: width,
                    color: AppColors.tabbg,
                    child: TabBar(padding: EdgeInsets.only(left: 20,right: 10),
                      controller: _controller,
                      indicatorColor: AppColors.primary,
                      tabs: [
                        // Tab(icon: Icon(Icons.flight,color: Colors.white,)),
                        Tab(
                          child: Text(
                            "About me",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Work',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Reviews',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height / 1.3,
                  width: width,
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      aboutme_worker(),
                      worklist_worker(),
                      reviews(),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )),
  );
  }
}
