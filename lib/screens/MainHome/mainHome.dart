import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:worker_app/Appurl/Appurl.dart';
import 'package:worker_app/screens/MainHome/price.dart';
import 'package:worker_app/screens/MainHome/search.dart';
import 'package:worker_app/screens/MainHome/user-profile.dart';
import 'package:worker_app/screens/role_filter/filter.dart';
import 'package:worker_app/utils/Colors.dart';
import 'package:worker_app/utils/drawer.dart';
import 'package:http/http.dart' as http;

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  Future? department;
  Future<List<dynamic>>? department2;
  @override
  void initState() {
    super.initState();
    department = departments();
    department2 = departments2();
  }

  Future<List<dynamic>> departments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'authorization': "Bearer $token"
    };

    var response =
        await http.get(Uri.parse(AppUrl.homePage), headers: requestHeaders);
    if (response.statusCode == 200) {
      print('Get post collected' + response.body);
      var userData1 = jsonDecode(response.body)['data']['dataService'];
      print(userData1);
      return userData1;
    } else {
      print("post have no Data${response.body}");
      var userData1 = jsonDecode(response.body)['data']['dataService'];
      return userData1;
    }
  }

  Future<List<dynamic>> departments2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'authorization': "Bearer $token"
    };

    var response =
        await http.get(Uri.parse(AppUrl.homePage), headers: requestHeaders);
    if (response.statusCode == 200) {
      print('Get post collected' + response.body);
      var userData1 = jsonDecode(response.body)['data']['dataSubscription'];
      print(userData1);
      return userData1;
    } else {
      print("post have no Data${response.body}");
      var userData1 = jsonDecode(response.body)['data']['dataSubscription'];
      return userData1;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  TextButton(
                    child: Text("YES"),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                  TextButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          key: _key,
          drawer: CustomDrawer(
            height: height,
            width: width,
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leadingWidth: 60,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.sort,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(() => user_profile(),
                        duration: Duration(
                            milliseconds:
                                500), //duration of transitions, default 1 sec
                        transition: Transition.zoom);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => search(),
                          duration: Duration(
                              milliseconds:
                                  500), //duration of transitions, default 1 sec
                          transition: Transition.leftToRight);
                    },
                    child: Container(
                        height: height / 18,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: AppColors.primary,
                              ),
                              Text('  Search for everything')
                            ],
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Services",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "See more",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(),
                  child: FutureBuilder(
                    future: department,
                    builder: (_, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 5,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.3),
                              highlightColor: Colors.grey.withOpacity(0.1),
                              child: ListView.builder(
                                itemBuilder: (_, __) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 48.0,
                                        height: 48.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: double.infinity,
                                              height: 8.0,
                                              color: Colors.white,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.0),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 8.0,
                                              color: Colors.white,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.0),
                                            ),
                                            Container(
                                              width: 40.0,
                                              height: 8.0,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                itemCount: 6,
                              ),
                            ),
                          );
                        default:
                          if (snapshot.hasError) {
                            Text('Error: ${snapshot.error}');
                          } else {
                            return snapshot.hasData
                                ? Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      child: GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 90,
                                          childAspectRatio: 4 / 4,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                        ),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (BuildContext ctx, index) {
                                          return InkWell(
                                            onTap: () {
                                              Get.to(filter());
                                            },
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl: AppUrl.pic_url1 +
                                                        snapshot.data[index]
                                                            ['image'],
                                                    fit: BoxFit.cover,
                                                    height: 40,
                                                    width: 40,
                                                    placeholder: (context,
                                                            url) =>
                                                        CircularProgressIndicator(),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(
                                                      Icons.source,
                                                      color: Color(0xff00D2CD),
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data[index]
                                                        ['name'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : Text('No data');
                          }
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),

                //!Subscription
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subscriptions",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                      ),
                      Text(
                        "See more",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: FutureBuilder<List<dynamic>>(
                        future: department2,
                        builder: (_, AsyncSnapshot snapshot) {
                          print(snapshot.data);
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Column(
                                children: [
                                  SizedBox(
                                    height: height / 2,
                                  ),
                                  Center(
                                    child: SpinKitRotatingCircle(
                                      color: Color(0xff0E6B50),
                                      size: 30,
                                    ),
                                  ),
                                ],
                              );
                            default:
                              if (snapshot.hasError) {
                                Text('Error: ${snapshot.error}');
                              } else {
                                return snapshot.hasData
                                    ? Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: height * 0.17,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (_, index) {
                                              // var imagelink=snapshot.data[index]['profile_image']!=null?snapshot.data[index]['profile_image']:'link';

                                              return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                        () => subscription(),
                                                        duration:
                                                            const Duration(
                                                          milliseconds: 400,
                                                        ),
                                                        transition:
                                                            Transition.zoom,
                                                      );
                                                    },
                                                    child: Container(
                                                      height: height / 7,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: height / 7,
                                                            width: width / 8,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                              color: AppColors
                                                                  .primary,
                                                            ),
                                                            child: Transform
                                                                .rotate(
                                                              angle:
                                                                  -3.1416 / 2,
                                                              child: Center(
                                                                child: Text(
                                                                  snapshot.data[
                                                                          index]
                                                                      [
                                                                      'package_type'],
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        snapshot.data[index]
                                                                            [
                                                                            'month_title'],
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            width /
                                                                                2,
                                                                      ),
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                AppColors.yeollo,
                                                                            borderRadius: BorderRadius.circular(7)),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(2.0),
                                                                          child:
                                                                              Text(
                                                                            snapshot.data[index]['sells'].toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    snapshot.data[
                                                                            index]
                                                                        [
                                                                        'package_title'],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      bottom:
                                                                          8),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        snapshot.data[index]
                                                                            [
                                                                            'package_type'],
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18),
                                                                      ),
                                                                      SizedBox(
                                                                        width: width /
                                                                            2.5,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(right: 6.0),
                                                                        child:
                                                                            Text(
                                                                          snapshot
                                                                              .data[index]['package_price']
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              color: AppColors.primary,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 20),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                            },
                                          ),
                                        ),
                                      )
                                    : Text('No data');
                              }
                          }
                          return CircularProgressIndicator();
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
