import 'package:flutter/material.dart';
import 'package:worker_app/utils/Colors.dart';
class settigns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: AppColors.primary,),),
        centerTitle: true,
        title: Text("Settings",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
            ),
          )
        ], ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Image.asset('assets/images/12.jpeg',height: 30,width: 30,),
              onTap: () {
                // Get.to(() =>  CustomBottomNavigationBar());
              },
              horizontalTitleGap: .1,
              title: const Text(
                "Account",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset('assets/images/13.jpeg',height: 30,width: 30,),
              onTap: () {
                // Get.to(() =>  CustomBottomNavigationBar());
              },
              horizontalTitleGap: .1,
              title: const Text(
                "Privacy & Security",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset('assets/images/14.jpeg',height: 30,width: 30,),
              onTap: () {
                // Get.to(() =>  CustomBottomNavigationBar());
              },
              horizontalTitleGap: .1,
              title: const Text(
                "Language",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset('assets/images/15.jpeg',height: 30,width: 30,),
              onTap: () {
                // Get.to(() =>  CustomBottomNavigationBar());
              },
              horizontalTitleGap: .1,
              title: const Text(
                "About us",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
