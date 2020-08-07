import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  bool bar_visibility = true;
  String title;
  Loader({this.title, this.bar_visibility = true});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Container(
      child: Center(child: CircularProgressIndicator()),
    ),
  );
  }
}
