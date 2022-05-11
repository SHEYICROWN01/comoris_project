import 'package:comoris_app/models/dashboardModel.dart';
import 'package:comoris_app/widgets/general_card.dart';
import 'package:comoris_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:comoris_app/login.dart';
import 'package:get/get.dart';

import 'Constant.dart';

class HomeScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final userName;

  HomeScreen({@required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchString = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<DashboardModel> currentDashboard = searchString == ''
        ? DASHBOARDMODELLIST
        : DASHBOARDMODELLIST
            .where((element) =>
                element.name1
                    ?.toLowerCase()
                    .contains(searchString.toLowerCase()) ==
                true)
            .toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
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
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0))),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () => _showMyDialog(),
                        child: Center(
                          child: Icon(
                            Icons.logout,
                            textDirection: TextDirection.ltr,
                            color: Colors.white,
                            size: 22.0,
                            semanticLabel:
                                'Icon', // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Hello.",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.white),
                  ),
                  SearchBar((s) {
                    setState(() {
                      searchString = s;
                    });
                  }),
                  Expanded(
                    child: GridView.builder(
                      itemCount: currentDashboard.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          crossAxisCount: (MediaQuery.of(context).orientation ==
                                  Orientation.portrait)
                              ? 2
                              : 3),
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () => currentDashboard[index].onclick!(),
                        child: GeneralCard(
                          name1: '${currentDashboard[index].name1}',
                          name2: '${currentDashboard[index].name2}',
                          color: currentDashboard[index].colors!,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      useSafeArea: true,
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          title: Text(
            'Sign Out',
            style: TextStyle(fontSize: 12),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Do you really want to log out?',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Yes',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
              onPressed: () {
                Get.to(() => Login());
              },
            ),
            TextButton(
              child: Text('No',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w900)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
