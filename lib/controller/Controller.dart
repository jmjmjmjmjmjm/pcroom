import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

class Controller extends GetxController {
  var charge = 0.obs; // 결제금액
  var m = 0.obs; // 내가 낸돈
  var state = "".obs; // 얼마가 부족한지
  String what = "";

  chargePlus(String hap, String what) {
    print('=====');
    charge.value = int.parse(hap);
    this.what = what;
    switch (what) {
      case "cash":
        {
          increment(hap);
          break;
        }
      case "card":
        {
          increment2(hap);
          break;
        }
    }
  }

  increment(String hap) {
    Timer.periodic(Duration(seconds: 3), (timer) {
      int my = (Random().nextInt(1000) + 1) * 10;
      if (m.value < my) m.value = my.toInt();
      if (m.value > charge.value) {
        timer.cancel();
        state.value = (m.value - charge.value).toString() + "잔돈입니다";
      }
      print(m.value);
    });
  }

  increment2(String hap) {
    print("int2 실행");
    Timer(Duration(seconds: 5), () {
      int my = (Random().nextInt(1000) + 1) * 10;
      m.value = my.toInt();
      if (m.value > charge.value) {
        state.value = "결제되었습니";
      } else {
        state.value = "잔액부족";
      }
    });
  }
}
