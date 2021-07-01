import 'package:flutter/material.dart';
import '../model/Dictionary.dart';

class ResultCard extends StatelessWidget {
  final ListElement? element;
  const ResultCard({Key? key, this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.pinkAccent, Colors.pink.shade300])),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Word : ${element!.word}',
              style: Theme.of(context).textTheme.headline5,
            ),
            Divider(),
            Text(
              "Definition : ${element!.definition}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Divider(),
            Text(
              '"Example : ${element!.example}"',
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }
}
