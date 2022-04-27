import 'package:flutter/material.dart';
import 'package:worker_app/screens/MainHome/user_profile_tabs/aboutme.dart';
import 'package:worker_app/screens/MainHome/user_profile_tabs/worklist.dart';
import 'package:worker_app/screens/role_filter/profile_tabs/Summary.dart';
import 'package:worker_app/screens/role_filter/profile_tabs/calender.dart';
import 'package:worker_app/utils/Colors.dart';

class user_profile extends StatefulWidget {
  @override
  _user_profileState createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> with SingleTickerProviderStateMixin{
  TabController? _controller;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 2, vsync: this);

}
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
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
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
            ),
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
                  aboutme(),
                  worklist(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
