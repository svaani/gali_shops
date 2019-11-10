import 'package:flutter/material.dart';
import 'package:gali_shops/others/api.dart';
import 'package:gali_shops/others/local_data.dart';
import 'package:gali_shops/screens/product.dart';
import 'package:gali_shops/widgets/bottom_navigation.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

class ProductListState extends State<ProductList> {
  API _api = API();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping At : " + LocalData().getPName(),
        ),
      ),
      body: FutureBuilder(
          future: _api.getAllProducts(LocalData().getPId()),
          builder: (BuildContext context, AsyncSnapshot itemsnapshot) {
            if (itemsnapshot.connectionState == ConnectionState.done &&
                itemsnapshot.hasData) {
              if (itemsnapshot.hasError) {
                return Text('Error: ${itemsnapshot.error}');
              } else {
                List productList = itemsnapshot.data;
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: productList.map((product) {
                    return Container(
                        height: 320,
                        child: Column(
                          children: <Widget>[
                            InkWell(child: SizedBox(
                              width: 300,
                              height: 200,
                              child: Image.network(product["Image"]),
                            ),
                            onTap: (){
                              LocalData().setPrId(product["PrId"]);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (Product())),
                                );
                            },
                            ),
                            ListTile(
                              onTap: () {
                                LocalData().setPrId(product["PrId"]);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (Product())),
                                );
                              },
                              title: Text(product["Name"]),
                              subtitle: Text(product["Price"] +
                                  " Rs " +
                                  product["Discount"] +
                                  "% OFF  " +
                                  (product["ViewAtHome"]
                                      ? "Trial Available"
                                      : "")),
                              trailing: RaisedButton(
                                child: Text("Add2Cart"),
                                onPressed: () {},
                                color: Colors.lightBlue,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ));
                  }).toList(),
                );
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
