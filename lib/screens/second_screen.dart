import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/number_provider.dart';

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('This is my second screen'),
          backgroundColor: Colors.amber,
        ),
        body: Consumer<NumberProvider>(
            builder: (BuildContext context, provider, Widget? child) => Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.numbersList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                provider.numbersList[index].toString(),
                                style: const TextStyle(fontSize: 25),
                              );
                            })),
                    ElevatedButton(
                        onPressed: () {
                          provider.updateTheList();
                        },
                        child: const Text('Add')),
                  ],
                )));
  }
}
