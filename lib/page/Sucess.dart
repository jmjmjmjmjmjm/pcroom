import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcroom/main.dart';

class SucessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "결제 완료",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
