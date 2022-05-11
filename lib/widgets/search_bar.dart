import 'package:flutter/material.dart';


class SearchBar extends StatelessWidget {
  final Function onChanged;
  const SearchBar(this.onChanged, {Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.0,
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: TextField(
        onChanged: (s) => onChanged(s),
        decoration:  InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search, size: 18,),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
