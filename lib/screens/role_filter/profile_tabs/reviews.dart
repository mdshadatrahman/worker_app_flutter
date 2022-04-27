import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:worker_app/utils/Colors.dart';
class reviews extends StatefulWidget {
  @override
  _reviewsState createState() => _reviewsState();
}

class _reviewsState extends State<reviews> {
  @override
  Widget build(BuildContext context) {var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.tabbg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("What peoples are saying",style: TextStyle(
                color: Colors.black,fontSize: 20
              ),),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,

                itemBuilder: (_,index){
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height/8,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.2),
                        //     spreadRadius: 2,
                        //     blurRadius: 5,
                        //     offset: Offset(
                        //         0, 3), // changes position of shadow
                        //   ),],
                      ),
                      child:   Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star,color: Colors.yellow,size: 30,),
                                    Icon(Icons.star,color: Colors.yellow,size: 30,),
                                    Icon(Icons.star,color: Colors.yellow,size: 30,),

                                    Icon(Icons.star,color: Colors.yellow,size: 30,),
                                  ],
                                ),
                                Text("12/02/2021",style: TextStyle(
                                  color:AppColors.primary
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("He is recommended and helpful.",style: TextStyle(color: Colors.black),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("By- Sharier Islam.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          )
                        ],
                      )
                    ),
                  );
                }),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height/22,

                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Show more reviews',style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18
                      ),),
                    ),
                  ],
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
