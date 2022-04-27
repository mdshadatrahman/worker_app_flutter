import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/Appurl/Appurl.dart';
import 'package:worker_app/Appurl/user_model.dart';
import 'package:worker_app/utils/Colors.dart';
import 'package:http/http.dart' as http;

import 'auth/login.dart';

class intro extends StatefulWidget {
  @override
  _introState createState() => _introState();
}

class _introState extends State<intro> {
  String? _mySelection = " 🇦🇺 English", _mySelection2;
  String? gender;
  var role;
  TextEditingController name = TextEditingController();
  var phone;

  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  bool step1 = false;
  bool step2 = false;
  bool step3 = false;
  bool step4 = false;
  bool step5 = false;
  bool step6 = false;
  bool worker = false;
  bool emp = false;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'BD';
  PhoneNumber number = PhoneNumber(isoCode: 'BD');
  Future registerApi_(String name, String role, String gender, String phone,
      String pass, String confirm_pass) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
    };
    var request = await http.MultipartRequest(
      'POST',
      Uri.parse(AppUrl.reg),
    );
    request.fields.addAll({
      'name': name,
      'phone': phone,
      'gender': gender,
      'password': pass,
      'status': role,
    });

    request.headers.addAll(requestHeaders);

    request.send().then((result) async {
      http.Response.fromStream(result).then((response) {
        if (response.statusCode == 201) {
          var data = jsonDecode(response.body);
          print(data);
          print('response.body ' + data.toString());
          Fluttertoast.showToast(
              msg: "OTP sent Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0);
          setState(() {
            step1 = true;
            step2 = true;
            step3 = true;
            step4 = true;
            step5 = true;
            step6 = false;
          });
          // Navigator.push(context, MaterialPageRoute(builder: (_)=>OtpVerificationScreen(phone: phone,)));

        } else {
          print("Fail! ");
          var data = jsonDecode(response.body);

          Fluttertoast.showToast(
              msg: data['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          return response.body;
        }
      });
    });
  }

  saveprefs(String token, String phone, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    prefs.setString('phone', phone);
    prefs.setString('name', name);
  }

  Future otpconfirm(String otp) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
    };
    var request = await http.MultipartRequest(
      'POST',
      Uri.parse(AppUrl.otp),
    );
    request.fields.addAll({'otp': otp, 'phone': phone});

    request.headers.addAll(requestHeaders);

    request.send().then((result) async {
      http.Response.fromStream(result).then((response) {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);

          print('response.body ' + data.toString());
          if (data['status_code'] == 200) {
            saveprefs(
              data['token']['plainTextToken'],
              data['data']['phone'],
              data['data']['name'],
            );

            Fluttertoast.showToast(
              msg: "Registered Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            Get.to(
              () => login_screen(),
              duration: Duration(
                milliseconds: 500,
              ),
              transition: Transition.zoom,
            );

            return user2.fromJson(data);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => login_screen()));
          } else {
            print("Fail! ");
            Fluttertoast.showToast(
              msg: data['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        } else {
          print("Fail! ");

          return response.body;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            step1 == false &&
                    step2 == false &&
                    step3 == false &&
                    step4 == false &&
                    step5 == false &&
                    step6 == false
                ? Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 5,
                        ),
                        Image.asset('assets/images/w1.jpeg'),
                        SizedBox(
                          height: height / 8,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              step1 = true;
                              step2 = false;
                              step3 = false;
                              step4 = false;
                              step5 = false;
                              step6 = false;
                            });
                          },
                          child: Container(
                            height: height / 18,
                            width: width / 1.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.primary),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : step1 == true &&
                        step2 == false &&
                        step3 == false &&
                        step4 == false &&
                        step5 == false &&
                        step6 == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height / 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Choose your\nLanguages",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Select the language of your choice",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.light_grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "I prefer",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width,
                              height: height / 18,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                child: new DropdownButton<String>(
                                  isExpanded: true, //Add this property

                                  hint: _mySelection == null
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Select Language ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.grey)),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(_mySelection!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.grey)),
                                        ),

                                  items: <String>[
                                    ' 🇧🇪 Germany',
                                    ' 🇧🇯 Youruba',
                                    ' 🇿🇦 Lgbo',
                                    ' 🇮🇨 Housa',
                                    ' 🇦🇺 English',
                                  ]
                                      .map<DropdownMenuItem<String>>((value) =>
                                          new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          ))
                                      .toList(),

                                  onChanged: (value) {
                                    setState(() {
                                      _mySelection = value;
                                    });
                                  },
                                  underline: DropdownButtonHideUnderline(
                                      child: Container()),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Cities / States",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width,
                              height: height / 18,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                child: new DropdownButton<String>(
                                  isExpanded: true, //Add this property

                                  hint: _mySelection2 == null
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Select Cities / States",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.grey)),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(_mySelection2!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.grey)),
                                        ),

                                  items: <String>[
                                    'Agege',
                                    'Ajeromi-Ifelodun',
                                    'Alimosho Amuwo-Odofin',
                                    'Apapa',
                                    'Eti-Osa',
                                    'Ifako-ljaye',
                                    'Ikeja',
                                    'Kosofe',
                                    'Lagos Island',
                                    'Lagos Mainland',
                                    'Mushin',
                                    'Ojo',
                                    'Oshodi-Isolo',
                                    'Shomolu',
                                    'Surulere',
                                    'Abia state',
                                    'Adamawa state',
                                    'Akwa Ibom state',
                                    'Anambra state',
                                    'Bauchi state',
                                    'Bayelsa state',
                                    'Benue state',
                                    'Borno state',
                                    'Cross River state',
                                    'Delta state',
                                    'Ebonyi state',
                                    'Edo state',
                                    'Ekiti state',
                                    'Enugu state',
                                    'Gombe state',
                                    'Imo state',
                                    'Jigawa state',
                                    'Kaduna state',
                                    'Kano state',
                                    'Katsina state',
                                    'Kebbi state',
                                    'Kogi state',
                                    'Kwara state',
                                    'Nasarawa state',
                                    'Niger state',
                                    'Ogun state',
                                    'Ondo state',
                                    'Osun state',
                                    'Oyo state',
                                    'Plateau state',
                                    'Rivers state',
                                    'Sokoto state',
                                    'Taraba state',
                                    'Yobe state',
                                    'Zamfara state'
                                  ]
                                      .map<DropdownMenuItem<String>>((value) =>
                                          new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          ))
                                      .toList(),

                                  onChanged: (value) {
                                    setState(() {
                                      _mySelection2 = value;
                                    });
                                  },
                                  underline: DropdownButtonHideUnderline(
                                      child: Container()),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 8,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  step1 = true;
                                  step2 = true;
                                  step3 = false;
                                  step4 = false;
                                  step5 = false;
                                  step6 = false;
                                });
                              },
                              child: Container(
                                height: height / 18,
                                width: width / 1.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.primary),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Keep Going",
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
                      )
                    : step1 == true &&
                            step2 == true &&
                            step3 == false &&
                            step4 == false &&
                            step5 == false &&
                            step6 == false
                        ? Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 5,
                                    width: width,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Divider(
                                            color: AppColors.primary,
                                            thickness: 5,
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Divider(
                                            color: Colors.white,
                                            thickness: 5,
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Divider(
                                            color: Colors.white,
                                            thickness: 5,
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Divider(
                                            color: Colors.white,
                                            thickness: 5,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                            height: height / 1.099,
                                            width: width,
                                            decoration: BoxDecoration(
                                                color: AppColors.primary
                                                    .withOpacity(.1)),
                                            child: Center(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.primary,
                                                ),
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                            top: height / 1.4,
                                            left: width / 1.50,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      step1 = true;
                                                      step2 = true;
                                                      step3 = true;
                                                      step4 = false;
                                                      step5 = false;
                                                      step6 = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: height / 22,
                                                    width: width / 4,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color:
                                                            AppColors.primary),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Skip",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 22),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : step1 == true &&
                                step2 == true &&
                                step3 == true &&
                                step4 == false &&
                                step5 == false &&
                                step6 == false
                            ? Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 5,
                                        width: width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Divider(
                                                color: AppColors.primary,
                                                thickness: 5,
                                              ),
                                            )),
                                            Expanded(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Divider(
                                                color: AppColors.primary,
                                                thickness: 5,
                                              ),
                                            )),
                                            Expanded(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Divider(
                                                color: Colors.white,
                                                thickness: 5,
                                              ),
                                            )),
                                            Expanded(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Divider(
                                                color: Colors.white,
                                                thickness: 5,
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    emp = true;
                                                    worker = false;
                                                    role = 0;
                                                  });
                                                },
                                                child: Container(
                                                  height: height / 7,
                                                  width: width / 3,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: emp == true
                                                              ? AppColors
                                                                  .primary
                                                              : Colors.white),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: emp == true
                                                              ? Colors
                                                                  .pinkAccent
                                                                  .withOpacity(
                                                                      0.1)
                                                              : Colors.grey
                                                                  .withOpacity(
                                                                      0.1),
                                                          spreadRadius: 1,
                                                          blurRadius: 2,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/w2.jpeg'),
                                                          fit:
                                                              BoxFit.fitWidth)),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Employer",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    emp = false;
                                                    worker = true;
                                                    role = 1;
                                                  });
                                                },
                                                child: Container(
                                                  height: height / 7,
                                                  width: width / 3,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: worker == true
                                                              ? AppColors
                                                                  .primary
                                                              : Colors.white),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: worker == true
                                                              ? Colors
                                                                  .pinkAccent
                                                                  .withOpacity(
                                                                      0.1)
                                                              : Colors.grey
                                                                  .withOpacity(
                                                                      0.1),
                                                          spreadRadius: 1,
                                                          blurRadius: 2,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/w3.jpeg'),
                                                          fit:
                                                              BoxFit.fitWidth)),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Worker",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height / 8,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          onTap: () {
                                            role != null
                                                ? setState(() {
                                                    step1 = true;
                                                    step2 = true;
                                                    step3 = true;
                                                    step4 = true;
                                                    step5 = false;
                                                    step6 = false;
                                                  })
                                                : null;
                                          },
                                          child: Container(
                                            height: height / 18,
                                            width: width / 1.8,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: AppColors.primary),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Continue",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                              )
                            : step1 == true &&
                                    step2 == true &&
                                    step3 == true &&
                                    step4 == true &&
                                    step5 == false &&
                                    step6 == false
                                ? Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 5,
                                            width: width,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    color: AppColors.primary,
                                                    thickness: 5,
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    color: AppColors.primary,
                                                    thickness: 5,
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    color: AppColors.primary,
                                                    thickness: 5,
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    color: Colors.white,
                                                    thickness: 5,
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 8,
                                          ),
                                          const Center(
                                            child: Text(
                                              "Signup",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24),
                                            ),
                                          ),
                                          Form(
                                            key: _formKey,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .pinkAccent
                                                              .withOpacity(0.1),
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          offset: Offset(0,
                                                              1), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Container(
                                                      height: height / 18,
                                                      width: width,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .pinkAccent
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 1,
                                                              offset: Offset(0,
                                                                  1), // changes position of shadow
                                                            ),
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: TextFormField(
                                                        controller: name,
                                                        validator: (v) => v!
                                                                .isEmpty
                                                            ? "Field can't be empty"
                                                            : null,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Name",
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .person_outline_rounded,
                                                                  color: Colors
                                                                      .black,
                                                                )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 25),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: width,
                                                    height: height / 18,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white70,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors
                                                                .pinkAccent
                                                                .withOpacity(
                                                                    0.1),
                                                            spreadRadius: 1,
                                                            blurRadius: 2,
                                                            offset: Offset(0,
                                                                1), // changes position of shadow
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors
                                                                .pinkAccent
                                                                .withOpacity(
                                                                    0.1),
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            offset: Offset(0,
                                                                1), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: DropdownButton<
                                                          String>(
                                                        isExpanded:
                                                            true, //Add this property

                                                        hint: gender == null
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Text(
                                                                    "Select Gender ",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .grey)),
                                                              )
                                                            : Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Text(
                                                                    gender!,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .grey)),
                                                              ),

                                                        items: <String>[
                                                          'Male',
                                                          'Female',
                                                        ]
                                                            .map<
                                                                DropdownMenuItem<
                                                                    String>>((value) =>
                                                                new DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child:
                                                                      new Text(
                                                                          value),
                                                                ))
                                                            .toList(),

                                                        onChanged: (value) {
                                                          setState(() {
                                                            gender = value;
                                                          });
                                                        },
                                                        underline:
                                                            DropdownButtonHideUnderline(
                                                                child:
                                                                    Container()),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 25),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .pinkAccent
                                                              .withOpacity(0.1),
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          offset: Offset(0,
                                                              1), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Container(
                                                      height: height /
                                                          16, //height / 18,
                                                      width: width,
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .pinkAccent
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 1,
                                                              offset: Offset(0,
                                                                  1), // changes position of shadow
                                                            ),
                                                          ],
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child:
                                                            InternationalPhoneNumberInput(
                                                          onInputChanged:
                                                              (PhoneNumber
                                                                  number) {
                                                            print(number
                                                                .phoneNumber);
                                                            setState(() {
                                                              phone = number
                                                                  .phoneNumber;
                                                            });
                                                          },
                                                          onInputValidated:
                                                              (bool value) {
                                                            print(value);
                                                          },
                                                          selectorConfig:
                                                              const SelectorConfig(
                                                            selectorType:
                                                                PhoneInputSelectorType
                                                                    .BOTTOM_SHEET,
                                                          ),
                                                          ignoreBlank: false,
                                                          autoValidateMode:
                                                              AutovalidateMode
                                                                  .disabled,
                                                          selectorTextStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                          initialValue: number,
                                                          textFieldController:
                                                              controller,
                                                          validator: (v) => v!
                                                                  .isEmpty
                                                              ? "Field can't be empty"
                                                              : null,
                                                          formatInput: false,
                                                          keyboardType:
                                                              const TextInputType
                                                                      .numberWithOptions(
                                                                  signed: true,
                                                                  decimal:
                                                                      true),
                                                          inputBorder:
                                                              InputBorder.none,
                                                          onSaved: (PhoneNumber
                                                              number) {
                                                            print(
                                                                'On Saved: $number');
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 25),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .pinkAccent
                                                              .withOpacity(0.1),
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          offset: const Offset(
                                                            0,
                                                            1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Container(
                                                      height: height / 18,
                                                      width: width,
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .pinkAccent
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 2,
                                                              offset: Offset(0,
                                                                  1), // changes position of shadow
                                                            ),
                                                          ],
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: TextFormField(
                                                        controller: password,
                                                        validator: (v) => v!
                                                                .isEmpty
                                                            ? "Field can't be empty"
                                                            : null,
                                                        obscureText:
                                                            !_showPassword,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Password",
                                                                suffixIcon:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _showPassword =
                                                                          !_showPassword;
                                                                    });
                                                                  },
                                                                  child: Icon(_showPassword
                                                                      ? Icons
                                                                          .visibility
                                                                      : Icons
                                                                          .visibility_off),
                                                                ),
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons.vpn_key,
                                                                  color: Colors
                                                                      .black,
                                                                )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 25),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .pinkAccent
                                                              .withOpacity(0.1),
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          offset: Offset(0,
                                                              1), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Container(
                                                      height: height / 18,
                                                      width: width,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .pinkAccent
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 2,
                                                              offset: Offset(0,
                                                                  1), // changes position of shadow
                                                            ),
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: TextFormField(
                                                        controller: confirm,
                                                        validator: (v) => v!
                                                                .isEmpty
                                                            ? "Field can't be empty"
                                                            : null,
                                                        obscureText:
                                                            !_showPassword,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Confirm Password",
                                                                suffixIcon:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _showPassword =
                                                                          !_showPassword;
                                                                    });
                                                                  },
                                                                  child: Icon(_showPassword
                                                                      ? Icons
                                                                          .visibility
                                                                      : Icons
                                                                          .visibility_off),
                                                                ),
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons.vpn_key,
                                                                  color: Colors
                                                                      .black,
                                                                )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 8,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: InkWell(
                                              onTap: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  registerApi_(
                                                    name.text,
                                                    role.toString(), //Shadat added .toString()
                                                    gender!,
                                                    phone,
                                                    password.text,
                                                    confirm.text,
                                                  );
                                                }
                                                print(phone);
                                              },
                                              child: Container(
                                                height: height / 18,
                                                width: width / 1.8,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: AppColors.primary),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Create Account",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                  )
                                : Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 5,
                                            width: width,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    color: AppColors.primary,
                                                    thickness: 5,
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    color: AppColors.primary,
                                                    thickness: 5,
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    color: AppColors.primary,
                                                    thickness: 5,
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    color: AppColors.primary,
                                                    thickness: 5,
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 8,
                                          ),
                                          Center(
                                            child: Text(
                                              "Enter Verification Code",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(28),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: _textFieldOTP(
                                                            first: true,
                                                            last: false,
                                                            controller_:
                                                                otp_1)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                        child: _textFieldOTP(
                                                            first: false,
                                                            last: false,
                                                            controller_:
                                                                otp_2)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                        child: _textFieldOTP(
                                                            first: false,
                                                            last: false,
                                                            controller_:
                                                                otp_3)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                        child: _textFieldOTP(
                                                            first: false,
                                                            last: true,
                                                            controller_:
                                                                otp_4)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 22,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 8,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: InkWell(
                                              onTap: () {
                                                otpconfirm(otp_1.text +
                                                    otp_2.text +
                                                    otp_3.text +
                                                    otp_4.text);
                                                // role == 0
                                                //     ? Get.to(() => MainHome(),
                                                //         duration: Duration(
                                                //             milliseconds:
                                                //                 500), //duration of transitions, default 1 sec
                                                //         transition: Transition
                                                //             .leftToRight //transition effect
                                                //         )
                                                //     : Get.to(() => catagory(),
                                                //         duration: Duration(
                                                //             milliseconds:
                                                //                 500), //duration of transitions, default 1 sec
                                                //         transition: Transition
                                                //             .leftToRight);
                                              },
                                              child: Container(
                                                height: height / 18,
                                                width: width / 1.8,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: AppColors.primary),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      "Verify",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
          ],
        ),
      ),
    ));
  }

  TextEditingController otp_1 = TextEditingController();
  TextEditingController otp_2 = TextEditingController();
  TextEditingController otp_3 = TextEditingController();
  TextEditingController otp_4 = TextEditingController();
  Widget _textFieldOTP(
      {required bool first, last, required TextEditingController controller_}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controller_,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: AppColors.primary),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
