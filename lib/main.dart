import 'package:first_project/bloc/cat_bloc.dart';
import 'package:first_project/bloc/theme_bloc.dart';
import 'package:first_project/cat.dart';
import 'package:first_project/cat_store.dart';
import 'package:first_project/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => CatBloc()),
    BlocProvider(create: (_) => ThemeBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // final Store<CatsState> store = Store<CatsState>(
  //   appReducer,
  //   /* Function defined in the reducers file */
  //   initialState: CatsState.initial(),
  // );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeBloc>().state,
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
    // _catStore.fetchNewCat();
    // context.read<CatBloc>().getCats();
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
            onTap: () {
              context.read<ThemeBloc>().setTheme(ThemeData.dark());
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CatBloc>().getCats();
        },
        child: Icon(Icons.plus_one),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child:
                    BlocBuilder<CatBloc, List<Cat>>(builder: (context, cats) {
                  return ListView(
                    children: cats.map((item) {
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
