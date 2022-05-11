import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';

class DetailsPage extends StatefulWidget {
  final List list;
  final int index;
  final String imageUrl;

  DetailsPage({required this.list, required this.index, required this.imageUrl });


  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  late final fileExtension;
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('Hello');
   debugPrint("http://comoris.uk.tempcloudsite.com/media/riders/${widget.imageUrl}/${widget.list[widget.index].ridersRegCode}.jpg");
    debugPrint('Hello');
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text("Riders Details"),
          centerTitle: true,
          backgroundColor: Colors.green.withOpacity(0.2),
        ),
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                SizedBox(height: 55,),
                Center(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Container(
                           decoration: BoxDecoration(
                               border: Border.all(
                                 color: Colors.green

                               ),
                               borderRadius: BorderRadius.all(Radius.circular(120))
                           ),
                           child: Container(
                              width: 250.0,
                              height: 250.0,
                              decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  image:  DecorationImage(
                                      fit: BoxFit.fill,
                                      image:  NetworkImage(
                                        "http://comoris.uk.tempcloudsite.com/media/riders/${widget.imageUrl}/${widget.list[widget.index].ridersRegCode}.jpg"
                                      )
                                  )
                              )),
                         ),
                        SizedBox(height: 20,),
                      ],
                    )),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.list[widget.index].ridersFullname,
                          textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold),)

                      ],

                    )

                  ) ,

                ),
                Text(widget.list[widget.index].ridersPhone,style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(" Registration Code : ",style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),),
                Text(widget.list[widget.index].ridersRegCode,style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(" Tracking ID Code : ",style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),),
                Text(widget.list[widget.index].ridersTrackingId,style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),

                SizedBox(height: 30,),
                Divider(
                  color: Colors.green,
                  thickness: 2.0,
                ),
                Text('Employer Details', style: TextStyle(fontSize:12 , fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(widget.list[widget.index].employerFullname,style: TextStyle( fontWeight: FontWeight.bold),textScaleFactor: 1.2),
                SizedBox(height: 5,),
                Text(widget.list[widget.index].employerGender,style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                SizedBox(height: 5,),
                Text("Address : ",style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),),
                Text(widget.list[widget.index].employerAddress == null ? 'No Address' : widget.list[widget.index].employerAddress, style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold ),),
                SizedBox(height: 5,),
                Text("Relationship with Employer : ",style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),),
                Text(widget.list[widget.index].employerRelationship,style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Riders Code : ",style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),),
                Text(widget.list[widget.index].employerRidersCode,style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                SizedBox(height: 50,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
