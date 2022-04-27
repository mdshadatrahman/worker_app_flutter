import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worker_app/screens/role_filter/profile.dart';
import 'package:worker_app/utils/Colors.dart';
import 'package:get/route_manager.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      appBar: AppBar(


        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Search Result',style: TextStyle(color: Colors.black,fontSize: 18),),
        leading: InkWell(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back,color: AppColors.primary,)),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  height: height/18,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(
                            0, 3), // changes position of shadow
                      ),],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search,color: AppColors.primary,),
                        hintText: "Search for worker",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),
                ),
              ),
            ),
            DefaultTabController(
              length: 3,
              child: Container(height: height/1,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonsTabBar(
                        backgroundColor: AppColors.primary,
                        contentPadding: EdgeInsets.all(8),borderColor: Colors.black54,

                        unselectedBackgroundColor: Colors.white,unselectedBorderColor: AppColors.primary,
                        unselectedLabelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        labelStyle:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(
                            text: "Basic",
                          ),
                          Tab(
                            text: "Advanced",
                          ), Tab(
                            text: "Premium",
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          Container(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,

                                itemBuilder: (_,index){
                                  return  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height/10,
                                      width: width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(
                                                0, 3), // changes position of shadow
                                          ),],
                                      ),
                                      child:   Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(

                                              children: [
                                                CircularProfileAvatar(
                                                  '',
                                                  child: Image.asset('assets/images/p1.jpg',fit: BoxFit.cover,),
                                                  borderColor: AppColors.primary,
                                                  borderWidth: 5,
                                                  elevation: 2,
                                                  radius: 30,
                                                ),
                                                SizedBox(width: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text('Eric Schmidt',style: TextStyle(color: Colors.black,fontSize: 16),),
                                                    ),

                                                    Row(
                                                      children: [
                                                        Icon(Icons.star,color:Colors.yellow),
                                                        Text(' 4.9'),
                                                        SizedBox(width: 10,),
                                                        Icon(Icons.volume_down,color: AppColors.primary,size: 30,),
                                                        Text(' View Audio',style: TextStyle(color: AppColors.primary,),),

                                                      ],
                                                    )
                                                  ],
                                                ),

                                              ],
                                            ),
                                            InkWell(
                                              onTap: (){
                                                Get.to(() =>  profile(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                                                    transition: Transition.leftToRight );},
                                              child  : Container(
                                                height: height/25,

                                                width: width/4.4,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(color: AppColors.primary)
                                                ),child: Center(
                                                child: Text('View Profile'),
                                              ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),

                          Container(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 3,

                                itemBuilder: (_,index){
                                  return  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height/10,
                                      width: width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(
                                                0, 3), // changes position of shadow
                                          ),],
                                      ),
                                      child:   Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(

                                              children: [
                                                CircularProfileAvatar(
                                                  '',
                                                  child: Image.asset('assets/images/p1.jpg',fit: BoxFit.cover,),
                                                  borderColor: AppColors.primary,
                                                  borderWidth: 5,
                                                  elevation: 2,
                                                  radius: 30,
                                                ),
                                                SizedBox(width: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text('Eric Schmidt',style: TextStyle(color: Colors.black,fontSize: 16),),
                                                    ),

                                                    Row(
                                                      children: [
                                                        Icon(Icons.star,color:Colors.yellow),
                                                        Text(' 4.9'),
                                                        SizedBox(width: 10,),
                                                        Icon(Icons.volume_down,color: AppColors.primary,size: 30,),
                                                        Text(' View Audio',style: TextStyle(color: AppColors.primary,),),

                                                      ],
                                                    )
                                                  ],
                                                ),

                                              ],
                                            ),
                                            InkWell(
                                              onTap: (){
                                                Get.to(() =>  profile(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                                                    transition: Transition.leftToRight );},
                                              child  : Container(
                                                height: height/25,

                                                width: width/4.4,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(color: AppColors.primary)
                                                ),child: Center(
                                                child: Text('View Profile'),
                                              ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),

                          Container(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 2,

                                itemBuilder: (_,index){
                                  return  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height/10,
                                      width: width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(
                                                0, 3), // changes position of shadow
                                          ),],
                                      ),
                                      child:   Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(

                                              children: [
                                                CircularProfileAvatar(
                                                  '',
                                                  child: Image.asset('assets/images/p1.jpg',fit: BoxFit.cover,),
                                                  borderColor: AppColors.primary,
                                                  borderWidth: 5,
                                                  elevation: 2,
                                                  radius: 30,
                                                ),
                                                SizedBox(width: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text('Eric Schmidt',style: TextStyle(color: Colors.black,fontSize: 16),),
                                                    ),

                                                    Row(
                                                      children: [
                                                        Icon(Icons.star,color:Colors.yellow),
                                                        Text(' 4.9'),
                                                        SizedBox(width: 10,),
                                                        Icon(Icons.volume_down,color: AppColors.primary,size: 30,),
                                                        Text(' View Audio',style: TextStyle(color: AppColors.primary,),),

                                                      ],
                                                    )
                                                  ],
                                                ),

                                              ],
                                            ),
                                            InkWell(
                                              onTap: (){
                                                Get.to(() =>  profile(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                                                    transition: Transition.leftToRight );},
                                              child  : Container(
                                                height: height/25,

                                                width: width/4.4,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(color: AppColors.primary)
                                                ),child: Center(
                                                child: Text('View Profile'),
                                              ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
