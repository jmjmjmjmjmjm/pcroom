import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcroom/controller/Controller.dart';

import 'Payment.dart';

class WayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    var money = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(money + "원"),
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: DropdownButton(
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => Text(c.dropdownValue.value)),
                    ),
                    items: c.list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      c.dropdownValue.value = value.toString();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  child: Text(
                    "선택 확인",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () => {
                    if (c.dropdownValue.value == "카드")
                      {
                        c.m.value = 0,
                        c.state.value = "",
                        Get.to(PaymentPage(), arguments: [money, "카드"])
                      }
                    else if (c.dropdownValue.value == "현금")
                      {
                        c.m.value = 0,
                        c.state.value = "",
                        Get.to(PaymentPage(), arguments: [money, "현금"])
                      }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
