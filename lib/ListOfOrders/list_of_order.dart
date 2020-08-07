import 'package:bhaigmaster/OrderDetailPage/order_detail_page.dart';
import 'package:bhaigmaster/Utils/app_models.dart';
import 'package:bhaigmaster/Utils/err.dart';
import 'package:bhaigmaster/Utils/loader.dart';
import 'package:flutter/material.dart';

import 'order_vm.dart';

class ListOfOrder extends StatefulWidget {
  @override
  _ListOfOrderState createState() => _ListOfOrderState();
}

class _ListOfOrderState extends State<ListOfOrder> {
  var orders = [
    {
      "order" : "#123456"
    },
    {
      "order" : "#123456"
    },
    {
      "order" : "#123456"
    },
    {
      "order" : "#123456"
    },
    {
      "order" : "#123456"
    },
    {
      "order" : "#123456"
    },

  ];

  TextEditingController searchOrder;
  List displayData;

  Future<OrderDetailsModel> mF;
  OrderAPI orderAPI;

  @override
  void initState() {
    searchOrder = TextEditingController();
    displayData = orders;
    orderAPI = OrderAPI();
    mF = orderAPI.getOrderData();
    super.initState();
  }

  @override
  void dispose() {
    searchOrder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: null,
        future: mF,
        builder: (context, snap) => _checkAPIData(context, snap));
  }

  Widget _checkAPIData(BuildContext c, AsyncSnapshot snap) {
    //ConnectionState.active = snap.connectionState
    if (snap.hasData) {
      // API
      // 404
      // catch
      OrderDetailsModel _d = snap.data;

      if (_d.status == 200) {
        return _buildList(_d);
      }
      else if (_d.is_loading ?? false) {
        return Loader(title: '');
      } else {
        return Err(
            bar_visibility: true,
            p_title: 'Home Page',
            m: "Error",
            mL: () => setState(() {
              _d.is_loading = true;
              mF = orderAPI.getOrderData();
            }));
      }
    } else {
      // initial loading
      //return new CircularProgressIndicator();
      return Loader(title: '');
    }
  }

  Widget _buildList(OrderDetailsModel d) {
    return Scaffold(
        appBar: AppBar(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(left: 8,right: 8),

              child: TextField(
                controller: searchOrder,
//                onChanged: (text) {
//                  text = text.toLowerCase();
//                  setState(() {
//                    displayData = d.data.where((element) {
//                      var nameVeg = element.Name.toLowerCase();
//                      //return nameVeg.contains(text);
//                      if(nameVeg.contains(text)) {
//                        return true;
//                      } else {
//                        var tagName = element.Tag.toString().toLowerCase();
//                        if(tagName.contains(text)) {
//                          return true;
//                        } else {
//                          return false;
//                        }
//                      }
//                    }).toList();
//                  });
//                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '   Search for the movies and cinemas'
                ),
              ),
            ),

            flexibleSpace: Container(),
            bottom: PreferredSize(preferredSize: Size(double.infinity, 10), child: Container(),)

        ),
        body: ListView.builder(
          itemCount: d.data.length,
          padding: EdgeInsets.all(8.0),
          shrinkWrap: true,
          itemBuilder: (context, int i){
            return Card(
              color: Colors.grey.shade400,
              child: ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      settings: RouteSettings(name: '/order_detail'),
                      pageBuilder: (c, a1, a2) => OrderDetailPage(
                        orderData : d.data[i],
                      ),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 500),
                    ),
                  );
                },
                title: Text("Order ${d.data[i].id}"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            );
          },
        )
    );
  }
}
