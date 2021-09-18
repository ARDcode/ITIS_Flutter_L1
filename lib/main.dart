import 'package:dio/dio.dart';
import 'package:first_project/api_client.dart';
import 'package:first_project/cat.dart';
import 'package:first_project/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  List<Cat>? cats;
  String url =
      'https://api.thecatapi.com/v1/images/search?breed_ids=beng&include_breeds=true';

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCatsWithRetrofit();
  }

  Future<void> _getCats() async {
    var response = await http.get(Uri.parse(url));
    setState(() {
      // cats = catFromJson(response.body);
    });
  }

  Future<void> _getCatsWithDio() async {
    Dio dio = Dio();

    dio
        .get(url)
        .then((response) => setState(() {
              // cats = catFromJson(jsonEncode(response.data));
            }))
        .catchError((error) {
      print(error.toString());
    });
  }

  Future<void> _getCatsWithRetrofit() async {
    RestClient restClient = RestClient(Dio());
    restClient.getCats().then((List<Cat> cats) {
      setState(() {
        this.cats = cats;
      });
    }).catchError((error) {
      print(error.toString());
    });
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
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: cats?.map((item) {
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
                      }).toList() ??
                      [],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
