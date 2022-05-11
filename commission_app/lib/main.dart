import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculate the area of a Circle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  int num1 = 0;
  int num2 = 0;
  int ans = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firstbank PLC'),
        centerTitle: true,
      ),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const ListTile(
            title: Text('₦80,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n467'),
            leading: Icon(Icons.money),
            trailing: Text('₦80,467'),
          ),
          const ListTile(
            title: Text('₦50,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n292'),
            leading: Icon(Icons.money),
            trailing: Text('₦50,292'),
          ),
          const ListTile(
            title: Text('₦70,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n408'),
            leading: Icon(Icons.money),
            trailing: Text('₦70,408'),
          ),
          const ListTile(
            title: Text('₦85,650'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n499'),
            leading: Icon(Icons.money),
            trailing: Text('₦86,149'),
          ),
          const ListTile(
            title: Text('₦92,150'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n541'),
            leading: Icon(Icons.money),
            trailing: Text('₦92,687'),
          ),
          const ListTile(
            title: Text('₦50,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n292'),
            leading: Icon(Icons.money),
            trailing: Text('₦50,292'),
          ),
          const ListTile(
            title: Text('₦120,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n700'),
            leading: Icon(Icons.money),
            trailing: Text('₦120,700'),
          ),
          const ListTile(
            title: Text('₦150,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n875'),
            leading: Icon(Icons.money),
            trailing: Text('₦150,875'),
          ),
          const ListTile(
            title: Text('₦135,700'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n792'),
            leading: Icon(Icons.money),
            trailing: Text('₦136,492'),
          ),
          const ListTile(
            title: Text('₦275,600'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n1,607'),
            leading: Icon(Icons.money),
            trailing: Text('₦277,207'),
          ),
          const ListTile(
            title: Text('₦200,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n1,166'),
            leading: Icon(Icons.money),
            trailing: Text('₦201,666'),
          ),
          const ListTile(
            title: Text('₦350,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n2,041'),
            leading: Icon(Icons.money),
            trailing: Text('₦352,041'),
          ),
          const ListTile(
            title: Text('₦80,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n467'),
            leading: Icon(Icons.money),
            trailing: Text('₦80,467'),
          ),
          const ListTile(
            title: Text('₦50,000'),
            isThreeLine: true,
            subtitle: Text('Bank 5% Interest\n2500'),
            leading: Icon(Icons.money),
            trailing: Text('₦50,292'),
          ),
          const ListTile(
            title: Text('₦270,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n1,575'),
            leading: Icon(Icons.money),
            trailing: Text('₦271,575'),
          ),
          const ListTile(
            title: Text('₦135,700'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n792'),
            leading: Icon(Icons.money),
            trailing: Text('₦136,492'),
          ),
          const ListTile(
            title: Text('₦500,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n2,916'),
            leading: Icon(Icons.money),
            trailing: Text('₦502,916'),
          ),
          const ListTile(
            title: Text('₦600,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n3,500'),
            leading: Icon(Icons.money),
            trailing: Text('₦603,500'),
          ),
          const ListTile(
            title: Text('₦450,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n2,625'),
            leading: Icon(Icons.money),
            trailing: Text('₦452,625'),
          ),
          const ListTile(
            title: Text('₦70,000'),
            isThreeLine: true,
            subtitle: Text('7% Interest per annum \n408'),
            leading: Icon(Icons.money),
            trailing: Text('₦70,408'),
          ),
        ],
      ),
    );
  }
}
