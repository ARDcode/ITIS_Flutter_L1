import 'package:first_project/module/home/cat_store.dart';
import 'package:first_project/module/home/model/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../theme_store.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({Key? key, required this.cat}) : super(key: key);

  final Cat cat;

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo>
    with SingleTickerProviderStateMixin {
  ThemeStore _themeStore = Modular.get<ThemeStore>();
  CatStore _catStore = Modular.get<CatStore>();

  late AnimationController _controller;
  late Animation<Size> _myAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _myAnimation = Tween<Size>(begin: Size(200, 200), end: Size(400, 400))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _controller.repeat();
    //   }
    // });
    // _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.id),
        actions: [
          GestureDetector(
            child: Icon(Icons.error),
            onTap: () {
              _themeStore.setTheme(ThemeData.dark());
            },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('123'),
                Text('123'),
                Text('123'),
                Text('123'),
                Text('123'),
                Text('123'),
              ],
            ),
          )),
    );
  }
}
