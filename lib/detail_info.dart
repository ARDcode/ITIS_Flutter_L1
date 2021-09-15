import 'package:flutter/material.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }
}
