import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worker_app/screens/MainHome/mainHome.dart';
import 'package:worker_app/utils/Colors.dart';

class success extends StatefulWidget {
  @override
  _successState createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 5,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: height / 3,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Changing password",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 100,
                      color: AppColors.primary,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Your password has been changed",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Successfully",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: height / 20),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Get.to(() => MainHome(),
                      duration: const Duration(
                          milliseconds:
                              500), //duration of transitions, default 1 sec
                      transition: Transition.leftToRight //transition effect
                      );
                },
                child: Container(
                  height: height / 18,
                  width: width / 1.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
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
