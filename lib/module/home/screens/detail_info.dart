import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../theme_store.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  ThemeStore _themeStore = Modular.get<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            child: Icon(Icons.error),
            onTap: () {
              _themeStore.setTheme(ThemeData.dark());
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
