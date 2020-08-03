import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = new TextEditingController();
  String filter = '';
  List<String> list = [
    'William',
    'James',
    'Harper',
    'Mason',
    'Evelyn',
    'Ella',
    'Avery',
    'Jackson',
    'John',
    'Bob',
    'Bale',
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: 5,
                    top: 35,
                    left: 15,
                    right: 5,
                  ),
                  height: 80,
                  width: double.infinity,
                  color: Color.fromRGBO(221, 221, 221, 1),
                  child: TextField(
                    controller: controller,
                    autofocus: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Search something',
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Color.fromRGBO(221, 221, 221, 1),
                padding: EdgeInsets.only(top: 25, right: 15),
                height: 80,
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (ctx, index) {
                return list[index]
                        .toString()
                        .toLowerCase()
                        .contains(filter.toLowerCase())
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22.0,
                          vertical: 10,
                        ),
                        child: Text(
                          list[index],
                          style: TextStyle(fontSize: 15.0),
                        ),
                      )
                    : SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
