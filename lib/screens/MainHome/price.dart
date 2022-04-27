import 'package:flutter/material.dart';
import 'package:worker_app/screens/MainHome/payment.dart';
import 'package:worker_app/utils/Colors.dart';
import 'package:get/route_manager.dart';

class subscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white ,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height:height/3.2,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/price.jpeg'),fit: BoxFit.cover)
              ),
            ),
            Center(child: Text('Upgrade to Premium',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 24),),),
            Center(child: Text('Unlimited swipes, Likes, Matches and so more',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(() =>  payment(), duration: Duration(milliseconds: 400), //duration of transitions, default 1 sec
                          transition: Transition.zoom );
                    },
                    child: Container(height: height/6,width: width/4.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)  ,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(
                                0, 1), // changes position of shadow
                          ),],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height:height/22,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),

                            ),child: Center(child: Text('Save 66 %',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                          ),
                          Text("12",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize:30 ),),
                          Text("months",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize:14 ),),
                          Text("6.00/mt",style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w700,fontSize:14 ),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(height: height/6,width: width/4.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)  ,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(
                              0, 1), // changes position of shadow
                        ),],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height:height/22,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),

                          ),child: Center(child: Text('Save 66 %',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                        ),
                        Text("12",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize:30 ),),
                        Text("months",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize:14 ),),
                        Text("6.00/mt",style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w700,fontSize:14 ),)
                      ],
                    ),
                  ),SizedBox(width: 20,),
                  Container(height: height/6,width: width/4.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)  ,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(
                              0, 1), // changes position of shadow
                        ),],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height:height/22,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),

                          ),child: Center(child: Text('Save 66 %',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                        ),
                        Text("12",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize:30 ),),
                        Text("months",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize:14 ),),
                        Text("6.00/mt",style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w700,fontSize:14 ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(child: Text('When will I be billed?',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w700,fontSize: 24),),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Yout Account will be billed at the end of your trial period (if applicable)or on confirmation of your subscription.',style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w600,fontSize: 14),),),
            ),       SizedBox(height: 15,),     Center(child: Text('Does My subscription Auto Renew?',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w700,fontSize: 24),),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Yes, You can disable this at any time with just one tap in the support.',style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w600,fontSize: 14),),),
            ),
          ],
        ),
      ),
    ));
  }
}
