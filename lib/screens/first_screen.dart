import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/number_provider.dart';
import 'package:provider_example/screens/second_screen.dart';

// ignore: must_be_immutable
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstaScreenState();
}

class _FirstaScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('At First Screen'),
          backgroundColor: Colors.blue,
        ),
        body: Consumer<NumberProvider>(
          builder: (BuildContext context, provider, Widget? child) => Center(
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 25 / 100),
              Text(
                provider.numbersList.last.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 10 / 100),
              ElevatedButton(
                  onPressed: () {
                    provider.updateTheList();
                  },
                  child: const Text('Add')),
              Expanded(
                child: ListView.builder(
                    itemCount: provider.numbersList.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return Text(
                        provider.numbersList[index].toString(),
                        style: const TextStyle(fontSize: 25),
                      );
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen()),
                    );
                  },
                  child: const Text('Click here'))
            ]),
          ),
        ),
      ),
    );
  }
}
