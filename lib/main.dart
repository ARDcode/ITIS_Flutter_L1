import 'package:first_project/cat.dart';
import 'package:first_project/cat_store.dart';
import 'package:first_project/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CatStore _catStore = CatStore();

  @override
  void initState() {
    super.initState();
    _catStore.fetchNewCat();
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _catStore.fetchNewCat,
        child: Icon(Icons.plus_one),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Observer(builder: (context) {
                  return ListView(
                    children: _catStore.filteredCats.map((item) {
                      return ListTile(
                        leading: _renderCatImage(item),
                        title: Text(
                          item.id,
                          style: const TextStyle(
                              color: Colors.deepOrange, fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailInfo(title: item.id)));
                        },
                      );
                    }).toList(),
                  );
                }),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
