import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _count = 0;
  void _onPressedRemove() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  void _onPressedPlus() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: _onPressedRemove,
                icon: const Icon(Icons.remove),
              ),
              Text('$_count', style: const TextStyle(fontSize: 24)),
              IconButton(
                onPressed: _onPressedPlus,
                icon: const Icon(Icons.plus_one),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
