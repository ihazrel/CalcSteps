// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StepsBackground extends StatelessWidget {
  int imageIndex = 0;

  StepsBackground({
    super.key,
    required this.imageIndex,
  });

  var imageList = [
    'exfactorize_1',
    'exfactorize_2',
    'exfactorize_3',
    'exfactorize_4',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFD1A7A0),
              borderRadius: BorderRadius.circular(32),
            ),
            height: 500,
            width: 1028,
          ),
          Positioned(
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD1A7A0),
                borderRadius: BorderRadius.circular(32),
              ),
              height: 500,
              width: 1028 - 350,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'image/${imageList[imageIndex]}.png',
                    width: 250,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
