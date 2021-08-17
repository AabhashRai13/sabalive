import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/store_controller_controller.dart';

class StoreSelectBottomSheet extends StatelessWidget {
  final StoreController _storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return _buildEventInfo(context);
  }

  Widget _buildEventInfo(BuildContext context) {
    return Obx(() => Column(
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
                    Text(_storeController.storeid.value ?? ""),
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
    _storeController.storenames.forEach((stores) {
      items.add(Column(
        children: <Widget>[
          new ListTile(
              title: new Text(stores),
              onTap: () async {
                Navigator.of(context).pop();
                _storeController.storeid.value = stores;
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
