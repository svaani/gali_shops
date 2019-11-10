import 'package:flutter/material.dart';
import 'package:gali_shops/others/api.dart';
import 'package:gali_shops/others/local_data.dart';
import 'package:gali_shops/screens/product.dart';
import 'package:gali_shops/screens/product_list.dart';
import 'package:gali_shops/widgets/bottom_navigation.dart';

class BrowsePartner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BrowsePartnerState();
  }
}

class BrowsePartnerState extends State<BrowsePartner> {
  API _api = API();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Shop : " + LocalData().getPName()),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text.rich(
            TextSpan(text: "Categories"),
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 30,
            ),
          ),
          FutureBuilder(
              future: _api.getCategoriesByPId(LocalData().getPId()),
              builder: (BuildContext context, AsyncSnapshot itemsnapshot) {
                if (itemsnapshot.connectionState == ConnectionState.done &&
                    itemsnapshot.hasData) {
                  if (itemsnapshot.hasError) {
                    return Text('Error: ${itemsnapshot.error}');
                  } else {
                    List categoryList = itemsnapshot.data;
                    return new HorizontalList(
                        list: categoryList, type: "Category");
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          Text.rich(
            TextSpan(text: "Products"),
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 30,
            ),
          ),
          FutureBuilder(
              future: _api.getAllProducts(LocalData().getPId()),
              builder: (BuildContext context, AsyncSnapshot itemsnapshot) {
                if (itemsnapshot.connectionState == ConnectionState.done &&
                    itemsnapshot.hasData) {
                  if (itemsnapshot.hasError) {
                    return Text('Error: ${itemsnapshot.error}');
                  } else {
                    List productList = itemsnapshot.data;
                    return new HorizontalList(
                        list: productList, type: "Product");
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
      bottomNavigationBar:
           BottomNavigation(),
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key key, @required this.list, this.type})
      : super(key: key);

  final List list;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: list.map((category) {
            return Container(
                width: 160.0,
                child: InkWell(
                  onTap: () {
                    if (type == "Category") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (ProductList())),
                      );
                    } else {
                      LocalData().setPrId(category["PrId"]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => (Product())),
                      );
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: Image.network(category["Image"]),
                      ),
                      Text(
                        category["Name"],
                        style: TextStyle(fontSize: 20, color: Colors.indigo),
                      )
                    ],
                  ),
                ));
          }).toList()),
    );
  }
}
