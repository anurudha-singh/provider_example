import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  List<int> numbersList = [];
  SecondScreen(List<int> numbersList, {super.key}) {
    this.numbersList = numbersList;
  }

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('This is my second screen'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.numbersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        widget.numbersList[index].toString(),
                        style: TextStyle(fontSize: 25),
                      );
                    })),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    int last =
                        widget.numbersList[widget.numbersList.length - 1] + 1;
                    widget.numbersList.add(last);
                    widget.numbersList[widget.numbersList.length - 1] = last;
                  });
                },
                child: const Text('Add')),
          ],
        ));
  }
}
