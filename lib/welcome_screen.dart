import 'dart:async';

import 'package:comoris_app/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () => Get.off(Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 180,
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent.withOpacity(0.2),
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        const BoxShadow(
                            color: Colors.greenAccent,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/img/comoris_app.png'),
                  ),
                ),
              SizedBox(height: 30,),
              SizedBox(
                width: 200.0,
                height: 100.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey,
                  child: Text(
                    'COMORIS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 8.0),
                //   child: Text(
                //     'COMORIS',
                //     style: TextStyle(
                //         fontSize: 25.0,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    '...Ogun State',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
