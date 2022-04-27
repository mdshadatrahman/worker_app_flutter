import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/utils/Colors.dart';

class worklist_worker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
  return SafeArea(child: Scaffold(
    backgroundColor: Colors.white38,
    body: SingleChildScrollView(
      child:             Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,

                  itemBuilder: (_,index){
                    return            Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height/8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(
                                    0, 3), // changes position of shadow
                              ),],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Driver",style: TextStyle(color: Colors.black,fontSize: 18),),
                                  Container(decoration: BoxDecoration(
                                      color: AppColors.primary,borderRadius: BorderRadius.circular(2)

                                  ),child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0,right: 4,bottom: 2,top: 2),
                                    child: Center(
                                      child: Text("Done",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                  ), )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,),
                              child: Text("Devit us",style: TextStyle(color: Colors.black,fontSize: 14),),
                            ),                 Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Row(
                                    children: [
                                      Text("Start Date : ",style: TextStyle(color: Colors.black,fontSize: 14),),
                                      Text("10/10/2022 ",style: TextStyle(color: AppColors.primary,fontSize: 14),),                                      Text(" to ",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                      Text("15/10/2022 ",style: TextStyle(color: AppColors.primary,fontSize: 14 ),),
                                    ],
                                  ),
                                  Container(decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: AppColors.primary)

                                  ),child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0,right: 4,bottom: 2,top: 2),
                                    child: Center(
                                      child: Text("Full Time",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    ),
                                  ), )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                    ;
                  }),
            ),

          ],
        ),
      ),
    ),
  ));
  }
}
