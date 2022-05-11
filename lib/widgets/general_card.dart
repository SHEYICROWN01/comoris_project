import 'package:flutter/material.dart';
class GeneralCard extends StatelessWidget {
  final String name1;
  final String name2;
  final Color color;
  const GeneralCard({
    Key? key, required this.name1,
    required this.name2, required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTile(
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget>[
               Material(
                  color: color,
                  shape:  const CircleBorder(),
                  child:  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Icon(Icons.location_on,
                          color: Colors.white, size: 30.0),
                    ),
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 16.0)),
              Center(child: Text(name1, style: const TextStyle(color: Colors.black45))),
              Center(
                child: Text(name2,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0)),
              ),
            ]),
      ),

    );
  }
  Widget _buildTile(Widget child, ) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: const Color(0x802196F3),
        child:  child);
  }
}