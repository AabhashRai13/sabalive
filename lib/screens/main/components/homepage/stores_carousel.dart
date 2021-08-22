import 'package:flutter/material.dart';
import 'package:sabalive/models/store_model.dart';
import 'package:sabalive/screens/main/components/homepage/ProductContainer.dart';
import 'package:sabalive/screens/main/components/product_list.dart';

class StoresCarousel extends StatelessWidget {
  const StoresCarousel({Key key,
    @required this.title,
    @required this.subtitle,
    @required this.storeList}) : super(key: key);
  
  final String title;
  final String subtitle;
  final List<Store> storeList;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
            child: Text(
                title,
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: Text(
                    'view all',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 200.0,
            child: storeList!= null ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: storeList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Store store= storeList[index];
                return StoreContainer(
                  product: store.products[index],
                );
              },
            ): Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
