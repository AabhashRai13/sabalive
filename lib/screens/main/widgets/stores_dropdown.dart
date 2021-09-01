import 'package:flutter/cupertino.dart';
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
                color: Colors.grey[200],
                border: Border.all(width: 1.0, color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(8.0),
                )
            ),
            child: DropDownFormField(
              hintText: "Stores",
              titleText: null,
              required: true,
              onChanged: (value) {
                GlobalVariables.storeId = value;
                _storeController.setStoreName(storeId: GlobalVariables.storeId);
                Get.off(() => MainPage());
              },
              dataSource: _storeController.dataSource,
              textField: 'store_name',
              valueField: 'id',
              filled: false,
              contentPadding: EdgeInsets.all(8.0),
            ),
          ));
  }
}
