import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/screens/role_filter/filter.dart';
import 'package:worker_app/screens/role_filter/profile.dart';
import 'package:worker_app/utils/Colors.dart';
class driver_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.backgrounf,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
          height: height/3,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/p1.jpg'),fit: BoxFit.cover),
            ),child: Container(

              child: Center(
              child: Icon(Icons.play_arrow,color: AppColors.primary,size: 50,),
          ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Advanced Driver",style: TextStyle(color: Colors.black,fontSize: 20),),
                  Row(
                    children: [
                      Icon(Icons.group,color: AppColors.primary,),
                      Text(' 4.5 k Employer')
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child : Text("This is a usefull service you can\n take if you want.",style: TextStyle(color: Colors.grey),)),
                  Row(
                    children: [

                      Text('Location'),
                      Icon(Icons.arrow_drop_down,color: Colors.black,),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Advanced Driver",style: TextStyle(color: Colors.black,fontSize: 20),),
            ),
           ListView.builder(
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
                                       Text(' 4.9')
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
               })

          ],
        ),
      ),
    ));
  }
}
