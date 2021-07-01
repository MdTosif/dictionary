import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Dictionary.dart';
import 'package:flutter_application_1/service/ApiCall.dart';
import 'page/ResultCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String word = 'ffs';
  Dictionary? data;
  Future<Dictionary> call() async {
    print('calling');
    ApiCall wordCall = ApiCall(this.word);
    Dictionary response = await wordCall.wordDictionary();
    setState(() {
      this.data = response;
    });
    print('done');
    return response;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data != null
          ? ListView.builder(
              itemCount: data!.list!.length,
              itemBuilder: (BuildContext context, int id) {
                return ResultCard(
                    element: ListElement(
                  word: data!.list![id].word,
                  definition: data!.list![id].definition,
                  example: data!.list![id].example,
                ));
              })
          : Text('data'),
      appBar: AppBar(
        title: TextField(
          onSubmitted: (str) {
            setState(() {
              this.word = str;
              this.call();
              print('submited');
            });
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.blue)),
            filled: true,
            contentPadding:
                EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            labelText: 'word',
          ),
        ),
        // actions: [Text('data')],
      ),
    );
  }
}


// ResultCard(
//             element: ListElement(
//                 word: 'ffs',
//                 definition: "[Acronym] for 'For [Fuck's Sake]!'",
//                 example:
//                     "Find First Set. Used in [Linux] programming as a quick way to find which is the first [bit of a] word, starting from [the least] significant bit, that is set."),
//           )
