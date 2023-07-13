import 'package:flutter/material.dart';
import 'dart:math';

class MovingScreen extends StatefulWidget {
  const MovingScreen({super.key});

  @override
  State<MovingScreen> createState() => _MovingScreenState();
}

var miny = 1000.0;
var height = 75.0;
var width = 75.0;
var check = 0;
var ghor = 1;

class _MovingScreenState extends State<MovingScreen> {
  void moveGuti() {
    int val = Random().nextInt(6) + 1;
    if (ghor + val > 100) return;
    while (val != 0) {
      ghor = ghor + 1;
      if (check % 2 == 0) {
        if (width + 77.5 > miny / 1.25) {
          check = check + 1;
          height = height + 77.5;
        } else {
          width = width + 77.5;
        }
      } else {
        if (width - 77.5 < 0) {
          check = check + 1;
          height = height + 77.5;
        } else {
          width = width - 77.5;
        }
      }
      val--;
    }
    setState(() {});
    if (ghor == 100) {
      check = 0;
      ghor = 1;
      width = 75;
      height = 75;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: miny / 1.25,
                width: miny / 1.25,
                child: const Image(
                  image: AssetImage('assets/images/board.png'),
                ),
              ),
              Container(
                height: height,
                width: width,
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                    child: const Text(
                      'Raj',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: moveGuti,
            child: const Icon(
              size: 50,
              color: Colors.red,
              Icons.directions_bike,
            ),
          ),
        ],
      ),
    );
  }
}
