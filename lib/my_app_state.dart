import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/my_icon.dart';

// ignore: public_member_api_docs
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

// ignore: public_member_api_docs
class MyAppState extends State<MyApp> {
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;
  bool _isAddIconVisible = false;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = _generateRandomColor();
      const threshold = 128;
      final bgDelta = (_backgroundColor.red * 0.299) +
          (_backgroundColor.green * 0.587) +
          (_backgroundColor.blue * 0.114);
      _textColor = (bgDelta > threshold) ? Colors.black : Colors.white;
      _isAddIconVisible = !_isAddIconVisible;
    });
  }

  Color _generateRandomColor() => Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Junior Flutter Developer'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: InkWell(
              splashColor: Colors.cyan[100],
              onTap: _changeBackgroundColor,
              child: Center(
                child: Text(
                  'Hello there',
                  style: TextStyle(fontSize: 24, color: _textColor),
                ),
              ),
            ),
          ),
          MyIcon(
            isAddIconVisible: _isAddIconVisible,
            backgroundColor: _backgroundColor,
          ),
        ],
      ),
      backgroundColor: _backgroundColor,
    );
  }
}
