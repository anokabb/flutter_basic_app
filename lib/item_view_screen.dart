import 'dart:developer';
import 'package:flutter/material.dart';

class ItemViewScreen extends StatefulWidget {
  final int? index;
  const ItemViewScreen({super.key, this.index});

  @override
  State<ItemViewScreen> createState() => _ItemViewScreenState();
}

class _ItemViewScreenState extends State<ItemViewScreen> {
  ValueNotifier<bool> isCheckBoxNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Item ${widget.index}'),
        actions: [
          IconButton(
            onPressed: () {
              log('action press');
            },
            icon: const Icon(Icons.info_outline),
          )
        ],
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.color_lens),
                    Text('Colors'),
                    Icon(Icons.color_lens),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: isCheckBoxNotifier,
                builder: (_, value, __) {
                  log('value updated to $value');
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: value ? Colors.red : Colors.blue,
                    ),
                    onPressed: () {
                      log('Elevated Button');
                    },
                    child: const Text('Elevated Button'),
                  );
                },
              ),
              OutlinedButton(
                onPressed: () {
                  log('Outlined Button');
                },
                child: const Text('Outlined Button'),
              ),
              TextButton(
                onPressed: () {
                  log('Text Button');
                },
                child: Text(
                  'Text Button',
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: isCheckBoxNotifier,
                builder: (_, value, __) {
                  log('value updated to $value');
                  return Checkbox(
                    value: value,
                    onChanged: (val) {
                      if (val != null) {
                        isCheckBoxNotifier.value = val;
                      }
                    },
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: isCheckBoxNotifier,
                builder: (_, value, __) {
                  log('value updated to $value');
                  return Switch.adaptive(
                    value: value,
                    onChanged: (val) {
                      if (val != null) {
                        isCheckBoxNotifier.value = val;
                      }
                    },
                  );
                },
              ),
              Image.asset(
                'images/car.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              const Divider(),
              Image.network(
                'https://i.pinimg.com/564x/7c/81/72/7c81728a7e8519dc2ca3e898d3d6211c.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
