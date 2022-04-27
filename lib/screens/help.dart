import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/screens/MainHome/settigns.dart';
import 'package:worker_app/utils/Colors.dart';
class help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(backgroundColor: Colors.white,
        centerTitle: true,elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: AppColors.primary,),),
        title: Text("Help",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: height/45,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(
                          0, 1), // changes position of shadow
                    ),],
                ),
                child: Container(
                  height: height/18,
                  width: width,
                  decoration: BoxDecoration(  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(
                          0, 1), // changes position of shadow
                    ),],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child:  ListTile(
                    leading: Image.asset('assets/images/8.jpeg',height: 30,width: 30,),
                    onTap: () {
                      // Get.to(() =>  settigns(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                      //     transition: Transition.leftToRight );
                    },
                    horizontalTitleGap: .1,
                    title: const Text(
                      "FAQ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height/45,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(
                          0, 1), // changes position of shadow
                    ),],
                ),
                child: Container(
                  height: height/18,
                  width: width,
                  decoration: BoxDecoration(  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(
                          0, 1), // changes position of shadow
                    ),],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child:  ListTile(
                    leading: Image.asset('assets/images/12.jpeg',height: 30,width: 30,),
                    onTap: () {
                      // Get.to(() =>  settigns(), duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                      //     transition: Transition.leftToRight );
                    },
                    horizontalTitleGap: .1,
                    title: const Text(
                      "Contact us!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),  ],
        ),
      ),
    ));
  }
}
