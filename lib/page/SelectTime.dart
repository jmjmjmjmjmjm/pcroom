import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcroom/page/WayPage.dart';

import 'Payment.dart';

class SelectTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('요금제선택'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
              timeBtn("01:00", "1000"),
              timeBtn("02:00", "2000"),
              timeBtn("03:00", "3000"),
              timeBtn("04:00", "4000"),
              timeBtn("05:00", "5000"),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton timeBtn(String time, String money) {
    return MaterialButton(
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                    child: Text(
                      money + "원",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(time + "분"),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      onPressed: () => showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(money + "원 입니다"),
            content: Text('확인바람'),
            actions: [
              MaterialButton(
                  child: Text(
                    "취소",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () => Navigator.pop(context, 'Cancel')),
              MaterialButton(
                child: Text(
                  "확인",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () => {
                  Navigator.pop(context, 'Cancel'),
                  Get.to(WayPage(), arguments: money),
                },
              )
            ],
          );
        },
      ),
    );
  }
}
