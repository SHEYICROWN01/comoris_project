import 'package:flutter/material.dart';

class JoBD extends StatefulWidget {
  final List list;
  final int index;

  const JoBD({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  _JoBDState createState() => _JoBDState();
}

class _JoBDState extends State<JoBD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.list[widget.index].ridersFullname),
          Text(widget.list[widget.index].author)
        ],
      ),
    );
  }
}
