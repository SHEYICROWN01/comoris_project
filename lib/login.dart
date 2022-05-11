import 'package:comoris_app/homePage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  bool processing = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _uiSetup(context);
  }

  void userSignIn() async {
    setState(() {
      processing = true;
    });
    var url = Uri.parse(
        "http://app.comoris.com/mobileApi/loginApi.php?username=${usernameController.text}&password=${passwordController.text}");
    var data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };
    var res = await http.post(url, body: data);
    if (jsonDecode(res.body) == "Success") {
      Fluttertoast.showToast(
        msg: "Login Successful",
        textColor: Colors.white,
        fontSize: 11,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.green,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    userName: usernameController.text,
                  )));
      setState(() {
        processing = false;
      });
    } else {
      if (jsonDecode(res.body) == "Error") {
        Fluttertoast.showToast(
          msg: "incorrect password",
          textColor: Colors.green,
          fontSize: 11,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.white,
        );
      } else {
        // print(jsonDecode(res.body));
      }
    }

    setState(() {
      processing = false;
    });
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.lightGreenAccent,
            ],
            begin: FractionalOffset(0.0, 0.2),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
                  margin:
                      const EdgeInsets.symmetric(vertical: 85, horizontal: 35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.greenAccent.withOpacity(.4),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 25),
                        Text(
                          "Login.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) =>
                              input!.isEmpty ? "username Please...." : null,
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:  Colors.white)),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.text,
                          validator: (input) => input!.length < 3
                              ? "Password should be more than 3 characters"
                              : null,
                          obscureText: hidePassword,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.2))),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.white),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Colors.white.withOpacity(0.9),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        processing == true ? const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            color: Colors.green,
                          ),
                        ) :FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (usernameController.text.isEmpty) {
                              Get.snackbar(
                                  'Error', 'Please Enter your Username',
                                  snackPosition: SnackPosition.BOTTOM);
                            } else if (passwordController.text.isEmpty) {
                              Get.snackbar(
                                  'Error', 'Please Enter your Password',
                                  snackPosition: SnackPosition.BOTTOM);
                            } else {
                              userSignIn();
                            }
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                          color: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
