import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/text_list_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var item = context.watch<ShoppingCart>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  itemBuilder: (ctx, i) {
                    return Dismissible(
                      background: Container(
                        color: Colors.green,
                      ),
                      key: ValueKey<String>(item.cart[i]),
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          item.cart.removeAt(i);
                        });
                      },
                      child: Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          title: Text(item.cart[i]),
                        ),
                      ),
                    );
                  },
                  itemCount: context.watch<ShoppingCart>().cart.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                ),
                Text('Number of items: ${item.count}'),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter input',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addItem_floatingActionButton'),
        onPressed: () => {
          context.read<ShoppingCart>().addItem(_textController.text),
          _textController.clear(),
        },
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
