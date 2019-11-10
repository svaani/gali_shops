import 'package:flutter/material.dart';
import 'package:gali_shops/others/api.dart';
import 'package:gali_shops/others/local_data.dart';
import 'package:gali_shops/widgets/bottom_navigation.dart';

class Product extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductState();
  }
}

class ProductState extends State<Product> {
  API _api = API();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product is at : " + LocalData().getPName(),
        ),
      ),
      body: FutureBuilder(
          future: _api.getProduct(LocalData().getPrId()),
          builder: (BuildContext context, AsyncSnapshot itemsnapshot) {
            if (itemsnapshot.connectionState == ConnectionState.done &&
                itemsnapshot.hasData) {
              if (itemsnapshot.hasError) {
                return Text('Error: ${itemsnapshot.error}');
              } else {
                var product = itemsnapshot.data[0];
                return Container(
                    child: Column(
                  children: <Widget>[
                    InkWell(
                      child: SizedBox(
                        width: 600,
                        height: 300,
                        child: Image.network(product["Image"]),
                      ),
                    ),
                    ListTile(title: Text(product["Name"])),
                    ListTile(
                      title: Text(product["Price"] + " Rs "),
                    ),
                    ListTile(title: Text(product["Discount"] + "% OFF  ")),
                    ListTile(
                      title: product["ViewAtHome"]
                          ? Text("Trial Available")
                          : Text("Trial Not Available"),
                    ),
                    ButtonBar(children: [
                       RaisedButton(
                        child: Text("View At Home"),
                        onPressed: () {
                           LocalData().add2Trial(product["PrId"]);
                        },
                        color: Colors.lightGreen,
                      ),
                      RaisedButton(
                        child: Text("Add2Cart"),
                        onPressed: () {
                          LocalData().add2Cart(product["PrId"]);
                        },
                        color: Colors.lightBlue,
                      )
                    ]),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
          
      bottomNavigationBar:
           BottomNavigation(),
    );
  }
}
