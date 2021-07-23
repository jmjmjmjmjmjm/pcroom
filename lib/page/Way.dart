import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Payment.dart';

class WayPage extends StatelessWidget {
  // void _paymentRoute(String money, String type) {
  //   Get.to(PaymentPage(), arguments: [money, type]);
  // } // 유효성체크후 부르는 함

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                items: ['카드결제', '현금결제']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// _paymentRoute(money, "cash")
