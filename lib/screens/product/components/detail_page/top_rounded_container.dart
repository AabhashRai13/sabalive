import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/app_properties.dart';
import 'package:sabalive/controllers/add_to_cart_controller.dart';
import 'package:sabalive/controllers/counter_controller.dart';
import 'package:sabalive/controllers/variant_button_controller.dart';
import 'package:sabalive/models/product_detail_model.dart';
import 'package:sabalive/screens/product/components/detail_page/related_product_container.dart';
import 'package:sabalive/screens/product/components/detail_page/variant_button.dart';

class TopRoundedContainer extends StatelessWidget {
  TopRoundedContainer({
    Key key,
    this.product,
  }) : super(key: key);
  final ProductDetails product;
  final AddToCartController addToCartController =
      Get.put(AddToCartController());
  final CounterController counterController = Get.put(CounterController());
  final VariantButtonController variantButtonController =
      Get.put(VariantButtonController());

      Future<void> _chooseOptionAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Choose choices from options'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('If you do not choose options form request option default option will be added.'),
              Text('Press Yes to continue anyway.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
                                 Navigator.of(context).pop();

                addToCartController.mapProduct(
                  productID: product.data.id,
                  productQuantiity: counterController.count, productChoices: counterController.optionId);
            },
          ),
           TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}

  Widget requestOptionWidget() {
    return GetBuilder<CounterController>(
        init: counterController
            .updateInitOptionId(product.data.productrequestoptions),
        builder: (_) =>product.data.productrequestoptions.length<=0?SizedBox(): Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 500),
                dividerColor: Colors.red,
                elevation: 1,
                children: [
                  ExpansionPanel(
                    body: Container(
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: product.data.productrequestoptions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product
                                  .data.productrequestoptions[index].request.capitalizeFirst),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: product
                                    .data
                                    .productrequestoptions[index]
                                    .productrequestoptionchoices
                                    .length,
                                itemBuilder: (context, index2) {
                                  return ListTile(
                                    title: Text(product
                                        .data
                                        .productrequestoptions[index]
                                        .productrequestoptionchoices[index2]
                                        .option.capitalize),
                                    leading: Radio(
                                      value: product
                                          .data
                                          .productrequestoptions[index]
                                          .productrequestoptionchoices[index2]
                                          .id,
                                      groupValue: counterController.optionId[index],
                                      onChanged: (value) {
                                        print(value);
                                        counterController.updateOptionId(
                                            index, value);
                                        
                                      },
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        );
                      },
                    )),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Request Options",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    isExpanded: counterController.isExpanded,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  counterController.expandWidget();
                },
              ),
            ));
  }



  Widget addToCartWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: Get.width / 2,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    counterController.decrement();
                  },
                  child: Icon(Icons.remove),
                ),
                Obx(
                  () => Text(
                    '${counterController.count}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    counterController.increment();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              
            counterController.firstTime!= 0?    addToCartController.mapProduct(
                  productID: product.data.id,
                  productQuantiity: counterController.count, productChoices: counterController.optionId): _chooseOptionAlert(context);
            },
            child: Container(
              height: 50,
              width: Get.width / 5,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: mainButtonColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blue),
              ),
              child: Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.grey[200],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.data.title.capitalize,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        product.data.store.storeName.capitalize,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Marked Price: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: "Rs ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            TextSpan(
                                text: product.data.markedPrice,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black))
                          ])),
                      SizedBox(
                        height: 5.0,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Selling Price: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: "Rs ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            TextSpan(
                                text: product.data.sellingPrice,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black))
                          ])),
                    ],
                  )),
            ],
          ),
          addToCartWidget(context),
          requestOptionWidget(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    product.data.description,
                    maxLines: 6,
                  ),
                ],
              )),
          product.relatedProducts.length == 0
              ? Container()
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Text("Related Product",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        )),
                  ),
                  Container(
                      height: 200.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.relatedProducts.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          RelatedProducts relatedproduct =
                              product.relatedProducts[index];
                          return RelatedProductContainer(
                            product: relatedproduct,
                          );
                        },
                      ))
                ],
              ),
        ],
      ),
    );
  }
}
