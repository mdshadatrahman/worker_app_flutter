import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/screens/worker/worker_profile.dart';
import 'package:worker_app/utils/Colors.dart';
import 'package:http/http.dart' as http;
import '../../Appurl/Appurl.dart';
import '../MainHome/mainHome.dart';
import '../worker/catagory.dart';
import 'forget_password.dart';

class login_screen extends StatefulWidget {
  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  String initialCountry = 'BD';
  PhoneNumber number = PhoneNumber(isoCode: 'BD');
  var phone;

  //!Learing login --starts

  Future login_api(String phone, String password) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
    };
    var request = await http.MultipartRequest(
      'POST',
      Uri.parse(AppUrl.login),
    );
    request.fields.addAll({
      'phone': phone,
      'password': password,
    });

    request.headers.addAll(requestHeaders);

    request.send().then((result) async {
      http.Response.fromStream(result).then((response) {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);

          if (data['status_code'] == 200) {
            var data = jsonDecode(response.body);
            print(data);
            print('response.body ' + data.toString());

            saveprefs(
              data['token']['plainTextToken'],
              data['data']['phone'],
              data['data']['status'],
            );
            Fluttertoast.showToast(
              msg: "Logged In Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            if (data['data']['status'] == 0) {
              Get.offAll(
                () => MainHome(),
                transition: Transition.rightToLeft,
              );
            } else {
              Get.offAll(
                () => catagory(),
                transition: Transition.rightToLeft,
              );
            }
          } else {
            print("Login Failed");
            var data = jsonDecode(response.body);
            Fluttertoast.showToast(
              msg: data['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
          return response.body;
        }
      });
    });
  }

  saveprefs(String token, String phone, int role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('phone', phone);
    prefs.setString('role', role.toString());
  }

  //!Learing login --ends

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
                height: height / 4,
              ),
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Container(
                    height: height / 16,
                    width: width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                          setState(() {
                            phone = number.phoneNumber;
                          });
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: number,
                        textFieldController: controller,
                        formatInput: false,
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: true,
                        ),
                        inputBorder: InputBorder.none,
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 1), // changes position of shadow
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
                            color: Colors.pinkAccent.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: TextFormField(
                      controller: password_controller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        () => forget_pass(),
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        transition: Transition.downToUp,
                      );
                    },
                    child: const Text(
                      "Forget Password",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    //TODO: Login Api
                    login_api(phone, password_controller.text);
                  },
                  child: Container(
                    height: height / 18,
                    width: width / 1.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
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
    );
  }
}
