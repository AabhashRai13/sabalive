import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/store_controller_controller.dart';

class StoresDropDown extends StatelessWidget {
  final StoreController _storeController = Get.put(StoreController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: DropDownFormField(
            hintText: "Stores",
            required: false,
            titleText: null,
            onChanged: (value) {
              _storeController.storeid.value = value;
            },
            value: _storeController.storeid.value,
            dataSource: _storeController.dataSource,
            textField: 'display',
            valueField: 'value',
          ),
        ));
  }
}
