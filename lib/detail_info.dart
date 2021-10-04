import 'package:first_project/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

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
        actions: [
          GestureDetector(
            child: Icon(Icons.error),
            onTap: () {
              context.read<ThemeBloc>().setTheme(ThemeData.light());
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
