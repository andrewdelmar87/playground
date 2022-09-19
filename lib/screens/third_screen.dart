import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/math_provider.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final _textControllerOne = TextEditingController();
  final _textControllerTwo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${context.watch<Math>().result}',
                style: const TextStyle(fontSize: 100),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: _textControllerOne,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter number',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textControllerOne.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: _textControllerTwo,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter number',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textControllerTwo.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            key: const Key('add_floatingActionButton'),
            onPressed: () => {
              context.read<Math>().add(int.parse(_textControllerOne.text),
                  int.parse(_textControllerTwo.text)),
              _textControllerOne.clear(),
              _textControllerTwo.clear(),
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            key: const Key('subtract_floatingActionButton'),
            onPressed: () => {
              context.read<Math>().subtract(int.parse(_textControllerOne.text),
                  int.parse(_textControllerTwo.text)),
              _textControllerOne.clear(),
              _textControllerTwo.clear(),
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: "btn3",
            key: const Key('multiply_floatingActionButton'),
            onPressed: () => {
              context.read<Math>().multiply(int.parse(_textControllerOne.text),
                  int.parse(_textControllerTwo.text)),
              _textControllerOne.clear(),
              _textControllerTwo.clear(),
            },
            child: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
