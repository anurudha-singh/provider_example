import 'package:flutter/material.dart';
import 'package:provider_example/screens/second_screen.dart';

// ignore: must_be_immutable
class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstaScreenState();
}

class _FirstaScreenState extends State<FirstScreen> {
  List<int> numbersList = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('At First Screen'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 25 / 100),
            Text(
              numbersList.last.toString(),
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 10 / 100),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    int last = numbersList[numbersList.length - 1] + 1;
                    numbersList.add(last);
                    numbersList[numbersList.length - 1] = last;
                  });
                },
                child: const Text('Add')),
            Expanded(
              child: ListView.builder(
                  itemCount: numbersList.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return Text(
                      numbersList[index].toString(),
                      style: TextStyle(fontSize: 25),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(numbersList)),
                  );
                },
                child: Text('Click here'))
          ]),
        ),
      ),
    );
  }
}
