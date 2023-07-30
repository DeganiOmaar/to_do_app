// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function myfunc;
  final Function delete;
  // final bool couleur ;
  // final Function clean;
  final int iii;

  const Todocard(
      {super.key,
      required this.vartitle,
      required this.doneORnot,
      required this.myfunc,
      required this.delete,
      // required this.couleur,
      // required this.clean,
      required this.iii});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.93,
      child: GestureDetector(
        onTap: () {
          myfunc(iii);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 95, 95, 95),
          ),
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: double.infinity,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: doneORnot
                      ? Color.fromARGB(255, 30, 30, 30)
                      : Colors.white,
                  decoration: doneORnot
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(
                    // Icons.close,
                    // Icons.check,

                    doneORnot ? Icons.check : Icons.close,
                    color: doneORnot ? Colors.green : Colors.red,
                    size: 26,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(iii);
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 28,
                    color: Color.fromARGB(255, 239, 121, 112),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
