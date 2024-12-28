import 'dart:ffi';

import 'package:calculater/core/colors.dart';
import 'package:calculater/logic/calculator_logic.dart';
import 'package:calculater/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String number = '0.0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    number,
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomButton(
                          onTap: onAcTap,
                          backgroundColor: appcolors.lightGrey,
                          textColor: appcolors.offwhite,
                          text: 'Ac',
                        )),
                        Expanded(
                            child: CustomButton(
                          onTap: onDeleteTap,
                          backgroundColor: appcolors.lightGrey,
                          textColor: appcolors.offwhite,
                          text: '',
                        )),
                        Expanded(
                            child: CustomButton(
                          onTap: onOpTap,
                          backgroundColor: appcolors.darkBlue,
                          textColor: appcolors.offwhite,
                          text: '/',
                        )),
                        Expanded(
                            child: CustomButton(
                          onTap: onOpTap,
                          backgroundColor: appcolors.darkBlue,
                          textColor: appcolors.offwhite,
                          text: '*',
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomButton(
                          onTap: onNumberTap,
                          text: '7',
                        )),
                        Expanded(
                            child: CustomButton(
                          onTap: onNumberTap,
                          text: '8',
                        )),
                        Expanded(
                            child: CustomButton(
                          onTap: onNumberTap,
                          text: '9',
                        )),
                        Expanded(
                          child: CustomButton(
                            onTap: onOpTap,
                            backgroundColor: appcolors.darkBlue,
                            textColor: appcolors.offwhite,
                            text: '_',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: CustomButton(
                                      onTap: onNumberTap,
                                      text: '4',
                                    )),
                                    Expanded(
                                        child: CustomButton(
                                      onTap: onNumberTap,
                                      text: '5',
                                    )),
                                    Expanded(
                                        child: CustomButton(
                                      onTap: onNumberTap,
                                      text: '6',
                                    )),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: CustomButton(
                                      onTap: onNumberTap,
                                      text: '1',
                                    )),
                                    Expanded(
                                        child: CustomButton(
                                      onTap: onNumberTap,
                                      text: '2',
                                    )),
                                    Expanded(
                                        child: CustomButton(
                                      onTap: onNumberTap,
                                      text: '3',
                                    )),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: CustomButton(
                                          onTap: onNumberTap,
                                          text: '0',
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: CustomButton(
                                          onTap: onNumberTap,
                                          text: '.',
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                  child: CustomButton(
                                onTap: onOpTap,
                                text: '+',
                                backgroundColor: appcolors.darkBlue,
                                textColor: appcolors.offwhite,
                              )),
                              Expanded(
                                  child: CustomButton(
                                onTap: onEqualTap,
                                text: '=',
                                textColor: appcolors.white,
                                backgroundColor: appcolors.lightblue,
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String left = '';
  String right = '';
  String selctedOp = '';
  double doubleNumber = 0;
  onNumberTap(String value) {
    if (number == '0.0') {
      number = '';
    } else if (selctedOp != '') {
      number = '';
    }

    number += value;
    setState(() {});
  }

  onAcTap(String value) {
    number = '0.0';
    setState(() {});
  }

  onOpTap(String op) {
    if (selctedOp == '') {
      left = number;
      number = '';
    } else {
      right = number;
      if (op == '+') {
        doubleNumber = double.parse(left) + double.parse(right);
      } else if (op == '_') {
        doubleNumber = double.parse(left) - double.parse(right);
      } else if (op == '*') {
        doubleNumber = double.parse(left) * double.parse(right);
      } else if (op == '/') {
        doubleNumber = double.parse(left) / double.parse(right);
      }
      number = doubleNumber.toString();
      left = number;
    }
    selctedOp = op;
    setState(() {});
  }

  onDeleteTap(String value) {
    String text = number.substring(0, number.length - 1);
    number = text;
    setState(() {});
  }

  onEqualTap(String value) {
    if (selctedOp == '') {
      return;
    }
    onOpTap(selctedOp);
    left = '';
    right = '';
    selctedOp = '';
    doubleNumber = 0;
    setState(() {});
  }
}
