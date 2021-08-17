import 'package:flutter/material.dart';
import 'package:sabalive/models/product.dart';


class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key key, this.product,
    
  }) : super(key: key);
  final Product product;
  
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0,
            vertical: 10.0),
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 40.0,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Colors.teal[200],
                ),
                child: Center(
                  child: IconButton(onPressed: (){
                  
                  },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                  ),
                ),
              ),
            ),
  
            Padding(
              padding: EdgeInsets.only(
                left: width*0.06,
                right: width*0.3
              ),
              child: Text(
                product.description,
                maxLines: 6,
              ),
            ),
            
          
          ],
        ),
      ),
    );
  }
}