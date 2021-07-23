import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcroom/main.dart';
import 'package:pcroom/page/Sucess.dart';

class Controller extends GetxController {
  var charge = 0.obs; // 결제금액
  var m = 0.obs; // 내가 낸돈
  var state = "".obs; // 얼마가 부족한지
  String what = "";
  var dropdownValue = "결제 방법을 선택".obs;
  var list = ["카드", "현금", "카드"];

  var _timer = Timer.periodic(Duration(seconds: 0), (timer) {});

  chargePlus(String hap, String what) {
    print('=====');
    charge.value = int.parse(hap);
    this.what = what;
    switch (what) {
      case "현금":
        {
          money(hap);
          break;
        }
      case "카드":
        {
          card(hap);
          break;
        }
    }
  }

  money(String hap) {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int my = (Random().nextInt(1000) + 1) * 10;
      if (m.value < my) m.value = my.toInt();
      if (m.value > charge.value) {
        timer.cancel();
        state.value = (m.value - charge.value).toString() + "잔돈입니다";
        timeToSucess();
      }
    });
  }

  card(String hap) {
    print("int2 실행");
    _timer = Timer(Duration(seconds: 5), () {
      int my = (Random().nextInt(1000) + 1) * 10;
      m.value = my.toInt();
      if (m.value > charge.value) {
        state.value = "결제되었습니다";
        timeToSucess();
      } else {
        state.value = "잔액부족";
      }
    });
  }

  timeToSucess() {
    Timer(Duration(seconds: 5), () {
      Get.offAll(SucessPage());
      timeToMain();
    });
  }

  timeToMain() {
    Timer(Duration(seconds: 8), () {
      m.value = 0;
      state.value = "";
      Get.offAll(MainPage());
    });
  }

  reset() {
    _timer.cancel();
    m.value = 0;
    state.value = "";
  }
}
