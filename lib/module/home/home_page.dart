import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_project/module/home/cat_store.dart';
import 'package:first_project/module/home/model/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:styled_widget/styled_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CatStore _catStore = Modular.get<CatStore>();

  double scale = 1;

  @override
  void initState() {
    super.initState();
    _catStore.fetchNewCat();
    initFirebase();
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.getToken().then((token) => print(token));
  }

  _renderCatImage(Cat cat) {
    Widget? image = Container();
    if (cat.url != null) {
      image = Image.network(
        cat.url!,
        fit: BoxFit.fill,
      );
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            child: Icon(Icons.error),
            onTap: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _catStore.fetchNewCat();
        },
        child: Icon(Icons.plus_one),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(child: Observer(builder: (context) {
                return ListView(
                  children: _catStore.cats.map((item) {
                    return ListTile(
                      leading: _renderCatImage(item),
                      title: Text(
                        item.id,
                      )
                          .textColor(Colors.blueAccent)
                          .fontSize(16)
                          .fontWeight(FontWeight.bold)
                          .scale(all: scale, animate: true)
                          .animate(
                              Duration(milliseconds: 1000), Curves.bounceInOut),
                      onTap: () {
                        // setState(() {
                        //   scale = 1.2;
                        // });
                        Modular.to.pushNamed('/detail/${item.id}');
                      },
                    );
                  }).toList(),
                );
              })),
            ],
          ),
        )),
      ),
    );
  }
}
