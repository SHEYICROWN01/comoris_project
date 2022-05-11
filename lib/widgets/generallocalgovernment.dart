import 'dart:convert';
import 'package:comoris_app/models/dataModel.dart';
import 'package:comoris_app/widgets/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GeneralLocalGovernment extends StatefulWidget {
  final String baseUrl;
  const GeneralLocalGovernment({Key? key, required this.baseUrl}) : super(key: key);


  @override
  _GeneralLocalGovernmentState createState() => _GeneralLocalGovernmentState();
}

class _GeneralLocalGovernmentState extends State<GeneralLocalGovernment> {
  bool isLoading = false;
  List<Post> _list = [];
  final List<Post> _search = [];
  var loading = false;
  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    var url = Uri.parse('http://app.comoris.com/mobileApi/${widget.baseUrl}.php');

    final response = await http.post(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
        _list = data.map<Post>((json) => Post.fromJson(json)).toList();
        setState(() {
          loading = false;
        });
    }
  }

  TextEditingController controller = TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var f in _list) {
      if (f.ridersFullname!.toLowerCase().contains(text.toLowerCase()) ||
          f.ridersTrackingId!.toString().toLowerCase().contains(text.toLowerCase())) {
        _search.add(f);
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

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
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.green.withOpacity(0.2),
            height: 45.0,
            child: TextFormField(
              controller: controller,
              onChanged: onSearch,
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
              : Expanded(
                  child: _search.isNotEmpty || controller.text.isNotEmpty
                      ? RefreshIndicator(
                          child: ListView.builder(
                            itemCount: _search.length,
                            padding: const EdgeInsets.all(0.0),
                            itemBuilder: (context, i) {
                              // final b = _search[i];
                              return GestureDetector(
                                onTap: ()=> Get.to(()=> DetailsPage(
                                  imageUrl: widget.baseUrl,
                                  index: i,
                                  list: _list,
                                )),
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 16,
                                              child: Icon(
                                                Icons.account_circle_rounded,
                                                size: 25,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        _search[i]
                                                            .ridersFullname!.toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('Reg Code '+
                                                        _search[i]
                                                            .ridersRegCode!
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,

                                                    children: [
                                                      Text('Tracking ID: '+
                                                        _search[i]
                                                            .ridersTrackingId!
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('Phone No: +234' +
                                                        _search[i]
                                                            .ridersPhone!
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    )),
                              );
                            },
                          ),
                          onRefresh: () {

                            return Future.delayed(const Duration(seconds: 1),
                                () {
                              setState(() {
                                fetchData();

                              });
                            });
                          },
                        )
                      : RefreshIndicator(
                    color: Colors.green.withOpacity(0.2),
                          child: ListView.builder(
                            itemCount: _list.length,
                            padding: const EdgeInsets.all(0.0),
                            itemBuilder: (context, i) {
                              // final a = _list[i];
                              return GestureDetector(
                                onTap: ()=> Get.to(()=> DetailsPage(
                                  imageUrl: widget.baseUrl,
                                  index: i,
                                  list: _list,
                                )),
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 16,
                                              child: Icon(
                                                Icons.account_circle_rounded,
                                                size: 25,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        _list[i]
                                                            .ridersFullname!
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('Reg Code: '+
                                                        _list[i]
                                                            .ridersRegCode!
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.end,

                                                    children: [
                                                      Text('Tracking ID: '+
                                                        _list[i]
                                                            .ridersTrackingId!
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('Phone No: +234'+
                                                          _list[i]
                                                            .ridersPhone!
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    )),
                              );
                            },
                          ),
                          onRefresh: () {
                            return Future.delayed(const Duration(seconds: 1),
                                () {
                              setState(() {
                                fetchData();
                              });
                            });
                          }),
                ),
        ],
      ),
    );
  }
}
