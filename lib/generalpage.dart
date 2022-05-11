//declare packages
import 'dart:async';
import 'dart:convert';
import 'package:comoris_app/widgets/detailsPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'models/dataModel.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralPage extends StatefulWidget {
  final String baseUrl;
  const GeneralPage({Key? key, required this.baseUrl}) : super(key: key);

  @override
  GeneralPageState createState() => GeneralPageState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class GeneralPageState extends State<GeneralPage> {
  TextEditingController controller = TextEditingController();

  final _debouncer = Debouncer();

  List<Post> ulist = [];
  List<Post> userLists = [];
  var loading = false;
  //API call for All Subject List



  Future<List<Post>> getAllulistList() async {
    var url = ('http://app.comoris.com/mobileApi/${widget.baseUrl}.php');
    setState(() {
      loading = true;
    });
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List<Post> list = parseAgents(response.body);
        setState(() {
          loading = false;
        });
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Post> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    getAllulistList().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
      });
    });
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Riders Details",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          //Search Bar to List of typed Subject
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.green.withOpacity(0.2),
            height: 45.0,
            child: TextFormField(
              controller: controller,
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    userLists = ulist
                        .where(
                          (u) => (u.ridersFullname!.toLowerCase().contains(
                        string.toLowerCase(),
                      )),
                    )
                        .toList();
                  });
                });
              },
              decoration: InputDecoration(
                prefixIcon:
                GestureDetector(child: const Icon(Icons.search, color: Colors.grey, size: 11)),
                suffixIcon: GestureDetector(
                  child: const Icon(Icons.cancel, color: Colors.grey, size: 11),
                  onTap: () {
                    controller.clear();
                  },
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                hintText: 'Search',
                hintStyle: const TextStyle(fontSize: 11, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          loading
              ?  Center(
            child: LinearProgressIndicator(
              backgroundColor: Colors.red,
              color: Colors.green,
            ),
          )
              :

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(5),
              itemCount: userLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(

                          onTap: ()=> Get.to(()=> DetailsPage(
                            index: index,
                            list:
                            userLists, imageUrl: widget.baseUrl,
                          )),
                          child: ListTile(
                            title: Text('Rider Fullname: ${ userLists[index].ridersFullname}' ,
                                style:  GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),

                            ),
                            subtitle: Text('Rider Reg Code: ${userLists[index].ridersRegCode}' ,
                              style: GoogleFonts.acme(fontSize: 12)
                            ),
                            leading: Image(
                              image: AssetImage(
                                  'assets/img/comoris_app.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//Declare Subject class for json data or parameters of json string/data
//Class For Subject
// class Subject {
//   var text;
//   var author;
//   Subject({
//     required this.text,
//     required this.author,
//   });
//
//   factory Subject.fromJson(Map<dynamic, dynamic> json) {
//     return Subject(
//       text: json['text'],
//       author: json['author'],
//     );
//   }
// }