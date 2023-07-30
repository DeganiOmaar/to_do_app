// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allTodos;
  final int allCompleted;

  Counter({super.key, required this.allTodos, required this.allCompleted});

  changeColor() {
    if (allTodos == allCompleted) {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        "$allCompleted/$allTodos",
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: allTodos == allCompleted ? Colors.green : Colors.white,
        ),
      ),
    );
  }
}
