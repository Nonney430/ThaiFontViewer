import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GameDomino extends StatefulWidget {
  const GameDomino({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GameDomino> {
  List<int> list = [0];
  bool showNumber = true;
  bool end = false;

  _buttonNumber_red(String number) {
    return Expanded(
      child: ElevatedButton(
        onPressed: showNumber || end
            ? null
            : () {
                setState(() {
                  list[0] += int.parse(number);
                  showNumber = !showNumber;
                  if (list[0] >= 20) end = true;
                });
              },
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
        ),
        child: Text(
          number,
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  _buttonNumber_blue(String number) {
    return Expanded(
      child: ElevatedButton(
        onPressed: !showNumber || end
            ? null
            : () {
                setState(() {
                  list[0] += int.parse(number);
                  showNumber = !showNumber;
                  if (list[0] >= 20) end = true;
                });
              },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
        child: Text(
          number,
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  _button_Newgame() {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          list[0] = 0;
          showNumber = true;
          end = false;
        });
      },
      child: Text(
        'NEW GAME',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var star = Column(
      children: [
        for (var i = 0; i < list[0]; i++)
          Container(
            child: Icon(
              Icons.grade,
              color: Colors.purple,
            ),
          ),
        for (var i = list[0]; i < 20; i++)
          Container(
            child: Icon(
              Icons.grade_outlined,
              color: Colors.purple,
            ),
          ),
      ],
    );

    var counter = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        !showNumber
            ? Icon(
                Icons.keyboard_arrow_up,
                size: 50,
              )
            : Icon(
                Icons.keyboard_arrow_up,
                size: 50,
                color: Colors.black12,
              ),
        Text(
          list[0].toString(),
          style: TextStyle(fontSize: 100),
        ),
        showNumber
            ? Icon(
                Icons.keyboard_arrow_down,
                size: 50,
              )
            : Icon(
                Icons.keyboard_arrow_down,
                size: 50,
                color: Colors.black12,
              )
      ],
    );

    var winner = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        showNumber
            ? Text(
                'BLUE',
                style: TextStyle(fontSize: 100),
              )
            : Text(
                'RED',
                style: TextStyle(fontSize: 100),
              ),
        Text(
          'win !',
          style: TextStyle(fontSize: 80),
        ),
        _button_Newgame(),
      ],
    );

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage("assets/images/bg.jpg"),
              fit: BoxFit
                  .fill, // ยืดเต็มพื้นที่โดยไม่สนใจสัดส่วนของภาพ หรือใช้ BoxFit.cover เพื่อยืดให้เต็มและคงสัดส่วนของภาพไว้ แต่บางส่วนของภาพอาจถูก crop
            ),
          ),
          child: SafeArea(
            // ไม่ให้ layout ไปอยู่ตรงส่วน status bar หรือ notch
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber_red('3'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber_red('2'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber_red('1'),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!end) star,
                        Expanded(child: end ? winner : counter),
                        Container()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber_blue('1'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber_blue('2'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buttonNumber_blue('3'),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
