import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcroom/page/SelectTime.dart';

import '../controller/Controller.dart';

class PaymentPage extends StatelessWidget {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    var value = Get.arguments[0];
    var what = Get.arguments[1];
    c.chargePlus(value, what);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            c.reset();
            Get.offAll(SelectTimePage());
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text("계산"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("계산금액 $value원",
                          style: TextStyle(fontSize: 30)))),
              Expanded(
                  flex: 3,
                  child: Align(
                      alignment: Alignment.center,
                      child: Obx(() =>
                          Text("${c.m} 원", style: TextStyle(fontSize: 30))))),
              Expanded(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.center,
                      child: Obx(() =>
                          Text("${c.state} ", style: TextStyle(fontSize: 30)))))
            ],
          ),
        ),
      ),
    );
  }
}
