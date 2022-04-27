import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/screens/MainHome/settigns.dart';
import 'package:worker_app/screens/auth/login.dart';
import 'package:worker_app/screens/help.dart';
import 'package:worker_app/screens/worker/catagory.dart';
import 'package:worker_app/utils/Colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white70),
            child: ListView(
              padding: EdgeInsets.only(right: width * 0.08),
              children: [
                SizedBox(height: height / 30),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Clair Vex",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppColors.primary,
                      ),
                      Text(
                        "Philipedia , Washington DC",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/images/7.jpeg',
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    Get.to(
                      () => catagory(),
                      duration: Duration(
                          milliseconds:
                              500), //duration of transitions, default 1 sec
                      transition: Transition.leftToRight,
                    );
                  },
                  horizontalTitleGap: .1,
                  title: const Text(
                    "Subscriptions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/images/8.jpeg',
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    Get.to(() => settigns(),
                        duration: Duration(
                            milliseconds:
                                500), //duration of transitions, default 1 sec
                        transition: Transition.leftToRight);
                  },
                  horizontalTitleGap: .1,
                  title: const Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/images/9.jpeg',
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    Get.to(() => help(),
                        duration: Duration(
                            milliseconds:
                                500), //duration of transitions, default 1 sec
                        transition: Transition.leftToRight);
                  },
                  horizontalTitleGap: .1,
                  title: const Text(
                    "Help",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/images/10.jpeg',
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    Get.offAll(() => login_screen(),
                        duration: Duration(
                            milliseconds:
                                500), //duration of transitions, default 1 sec
                        transition:
                            Transition.rightToLeftWithFade //transition effect
                        );
                  },
                  horizontalTitleGap: .1,
                  title: const Text(
                    "Logout",
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
        ],
      ),
    );
  }
}
