import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<int> list = [1, 2, 3];
  bool showNumber = true;

  _handleClickButton() {
    setState(() {
      list.add(list.length + 1);
    });
  }

  _handleClickButton2() {
    setState(() {
      showNumber = !showNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list
                      .map(
                        (e) => Text(
                      e.toString(),
                    ),
                  )
                      .toList(),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: _handleClickButton, child: Text('TEST')),
                SizedBox(
                  width: 20.0,
                ),
                TextButton(
                    onPressed: _handleClickButton2, child: Text('TEST2')),
              ],
            ),
            Image(
              image: AssetImage(
                  showNumber ? 'assets/images/p.png' : 'assets/images/op.png'),
              width: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
