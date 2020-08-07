import 'package:bhaigmaster/Utils/app_models.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {

  OrderDetailsData orderData;

  OrderDetailPage({Key key, this.orderData}) : super(key : key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {

  var obj = [
    {
      "name" : "Tomato",
      "price" : 56
    },
    {
      "name" : "Tomato",
      "price" : 56
    },
    {
      "name" : "Tomato",
      "price" : 56
    },
    {
      "name" : "Tomato",
      "price" : 56
    },
    {
      "name" : "Tomato",
      "price" : 56
    },
    {
      "name" : "Tomato",
      "price" : 56
    },
    {
      "name" : "Tomato",
      "price" : 56
    },
    {
      "name" : "Tomato",
      "price" : 56
    },
    {
      "name" : "Tomato",
      "price" : 56
    },
    {
      "name" : "Tomato",
      "price" : 56
    }
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Detail"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              color: Colors.grey.shade400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Order ${widget.orderData.id}", style: TextStyle(fontSize: 22),),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 25,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Name", style: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Expanded(
                          flex: 75,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${widget.orderData.Name}"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 25,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Address", style: TextStyle(fontSize: 15))
                          ),
                        ),
                        Expanded(
                          flex: 75,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${widget.orderData.Address}"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 25,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Phone Number", style: TextStyle(fontSize: 15))
                          ),
                        ),
                        Expanded(
                          flex: 75,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Colors.white
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${widget.orderData.PhoneNumber}"),
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 25,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("PinCode", style: TextStyle(fontSize: 15),)
                          ),
                        ),
                        Expanded(
                          flex: 75,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Colors.white
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${widget.orderData.PinCode}"),
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 32.0,),
                  for(var item in widget.orderData.Cart) getWidgets(item),
                  SizedBox(height: 24.0,),
                  Row(
                    children: <Widget>[
                      Container(
                        width: w/2-20,
                        height: 50,
                      ),
                      Container(
                        width: w/2-20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                width: w/4-20,
                                alignment: Alignment.centerRight,
                                child: Text("Delivery", style: TextStyle(fontSize: 18),)),
                            Container(
                                width: w/4-20,
                                alignment: Alignment.centerRight,
                                child: Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: Text("0",style: TextStyle(fontSize: 18),),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Container(
                        width: w/2-20,
                      ),
                      Container(
                        width: w/2-20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                width: w/4-20,
                                alignment: Alignment.centerRight,
                                child: Text("Total", style: TextStyle(fontSize: 18),)),
                            Container(
                                width: w/4-20,
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 24.0),
                                  child: Text("${widget.orderData.TotalPrice}",style: TextStyle(fontSize: 18),),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0,),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0,),
          Container(
            height: 60.0,
            width: w,
            child: RaisedButton(
              color: Colors.black87,
              onPressed: (){

              },
              child: Text("Confirm Order", style: TextStyle(fontSize: 22, color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }

  Widget getWidgets(OrderCartData item) {
    Widget mw = Container();
    mw = Padding(
      padding: const EdgeInsets.only(left: 48, right: 24.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 75,
              child: Text(item.VegName, style: TextStyle(fontSize: 16),)),
          Expanded(
              flex: 25,
              child: Text("${item.TotalPrice}", style: TextStyle(fontSize: 16),)),
        ],
      ),
    );
    return mw;
  }

}
