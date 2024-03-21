import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gone_board/src/utils.dart';

class GonePage{
  final BuildContext context;
  final String image;
  final String text;
  final Color color;

  GonePage({
    required this.context,
    required this.image,
    required this.text,
    required this.color
  });

  Widget build(){
    return Container(
      color: darkPrimary,
      padding: const EdgeInsets.fromLTRB(16, 80, 16, 20),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: color,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            image,
            width: 300,
            height: 300,
          ).animate()
              .moveY(begin: 120, end: 0, duration: const Duration(milliseconds: 600)),
        ],
      ),
    );
  }
}