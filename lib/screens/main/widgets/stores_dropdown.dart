import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/constants/global_variables.dart';
import 'package:sabalive/controllers/store_controller_controller.dart';
import 'package:sabalive/screens/main/main_page.dart';

class StoresDropDown extends StatelessWidget {
  final StoreController _storeController = Get.put(StoreController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => _storeController.state == ViewState.Busy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: DropDownFormField(
              hintText: "Stores",
              required: false,
              titleText: null,
              onChanged: (value) {
                GlobalVariables.storeId = value;
                _storeController.setStoreName(storeId: GlobalVariables.storeId);

                Get.off(() => MainPage());
              },
              dataSource: _storeController.dataSource,
              textField: 'store_name',
              valueField: 'id',
            ),
          ));
  }
}
