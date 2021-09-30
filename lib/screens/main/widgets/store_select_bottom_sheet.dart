import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/home_controller_controller.dart';
import 'package:sabalive/controllers/store_controller_controller.dart';
import 'package:sabalive/screens/main/widgets/drawer.dart';

class StoreSelectBottomSheet extends StatelessWidget {
  final StoreController _storeController = Get.put(StoreController());
  final HomeController homeController;

  StoreSelectBottomSheet({this.homeController});
  @override
  Widget build(BuildContext context) {
    return _buildEventInfo(context);
  }
  
  Widget _buildEventInfo(BuildContext context) {
    return GetBuilder<StoreController>( 
  builder: (_) =>  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
          child: Text('Selected Store', textScaleFactor: 1.1),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 4),
          height: 24,
          child: InkWell(
            onTap: () {
              _settingModalBottomSheet(
                context,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(sharedPreferencesManager.getString("storename")?? ""),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ),
        Divider(),
      ],
    ));
  }
  
  void _settingModalBottomSheet(
      context,
      ) {
    var children = <Widget>[];
    children.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Select Store",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ));
    children.add(Divider(
      height: 2,
    ));
    final items = <Widget>[];
    _storeController.stores.forEach((stores) {
      items.add(Column(
        children: <Widget>[
          new ListTile(
              title: new Text(stores.storeName),
              onTap: () async {
                Navigator.of(context).pop();
              _storeController.setStoreData(storeId: stores.id, storeName: stores.name);
                homeController.fetchStoreWiseProducts();
                homeController.fetchCategoryList();
                homeController.fetchSliderProductList();
              }),
          Divider(
            height: 2,
          )
        ],
      ));
    });
    final list = Expanded(
      child: ListView(
        children: items,
        shrinkWrap: true,
      ),
    );
    children.add(list);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Column(
            children: children,
          );
        });
  }
}