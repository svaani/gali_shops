import 'package:flutter/material.dart';
import 'package:gali_shops/others/api.dart';
import 'package:gali_shops/others/local_data.dart';

import '../browse_partner.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandingState();
  }
}

class LandingState extends State<LandingPage> {
  API _api = API();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gali Shops"),
        ),
        body: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Text.rich(
                TextSpan(text: "Near By Shops"),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FutureBuilder(
                  future: _api.getNearByPartners(),
                  builder: (BuildContext context, AsyncSnapshot itemsnapshot) {
                    if (itemsnapshot.connectionState == ConnectionState.done &&
                        itemsnapshot.hasData) {
                      if (itemsnapshot.hasError) {
                        return Text('Error: ${itemsnapshot.error}');
                      } else {
                        List partnerList = itemsnapshot.data;
                        return PartnerList(partnerList: partnerList);
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              SizedBox(
                height: 50,
              ),
              Text.rich(
                TextSpan(text: "Your Favourites"),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
              FutureBuilder(
                  future: _api.getNearByPartners(),
                  builder: (BuildContext context, AsyncSnapshot itemsnapshot) {
                    if (itemsnapshot.connectionState == ConnectionState.done &&
                        itemsnapshot.hasData) {
                      if (itemsnapshot.hasError) {
                        return Text('Error: ${itemsnapshot.error}');
                      } else {
                        List partnerList = [itemsnapshot.data[0]];
                        return PartnerList(partnerList: partnerList);
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ));
  }
}

class PartnerList extends StatelessWidget {
  const PartnerList({
    Key key,
    @required this.partnerList,
  }) : super(key: key);

  final List partnerList;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: partnerList.map((partner) {
      return InkWell(
          onTap: () {
            LocalData().setPId(partner["PId"]);
            LocalData().setPName(partner["Name"]);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => (BrowsePartner())),
            );
          },
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                    width: 200,
                    height: 100,
                    child: Image.network(partner["Image"])),
                Text(
                  partner["Name"],
                  style: TextStyle(fontSize: 20, color: Colors.indigo),
                )
              ],
            ),
          ));
    }).toList());
  }
}
