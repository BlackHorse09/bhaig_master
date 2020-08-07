import 'dart:convert';

import 'package:bhaigmaster/Utils/app_models.dart';
import 'package:bhaigmaster/Utils/connection_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductUpdate extends StatefulWidget {

  CategrotyData data;

  ProductUpdate({Key key, this.data}) : super(key : key);

  @override
  _ProductUpdateState createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {

  bool status = true;

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ConnectionHelper mCH;

  @override
  void initState() {
    status = widget.data.Display;
    name.text = widget.data.Name;
    price.text = widget.data.Cost.toString();
    stock.text = widget.data.Stock.toString();
    mCH = ConnectionHelper.getInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Do you want to display"),
        actions: <Widget>[
          Switch(
            activeColor: Colors.yellowAccent,
            value: status,
            onChanged: (value) {
              print("VALUE : $value");
              setState(() {
                status = value;
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 16.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 8.0,),
                  Container(
                    height: h*0.25,
                    color: Colors.transparent,
                    child: Image.asset("assets/demo.jpeg", fit: BoxFit.cover,),
//                          child: CachedNetworkImage(
//                            fit: BoxFit.cover,
//                            imageUrl: 'http://dexterlabs.co.in/images/portfolio/Logikart.jpg',
//                            placeholder: (context, url) => CircularProgressIndicator(),
//                            errorWidget: (context, url, error) => Icon(Icons.error),
//                          ),
                  ),
                ],
              ),
            ),
          ),

          Container(

            child: Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Container(
                      height: h*0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.shade400,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 25,
                            child: Container(child: Text("Name", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),)),
                          ),
                          Expanded(
                            flex: 75,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  controller: name,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.shade400,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 25,
                            child: Container(child: Text("Price", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),)),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  controller: price,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.shade400,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 25,
                            child: Container(child: Text("Stock", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),)),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  controller: stock,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Container(
                      height: h*0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.shade400,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 25,
                            child: Container(child: Text("Weight", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),)),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Center(child: Text("Kg"))
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                ],
              ),
            ),
          ),

          SizedBox(height: 8.0,),

          Container(
            height: 70.0,
            width: w,
            child: RaisedButton(
              onPressed: () async {
                bool con = await mCH.checkConnection();
                if(con) {
                  var req = json.encode({
                    "Name" : "${name.text}",
                    "ProductCode" : "${widget.data.ProductCode}",
                    "ListImage" : "${widget.data.ListImage}",
                    "DescriptionImage" : "${widget.data.DescriptionImage}",
                    "WeightIdentifier" : "${widget.data.WeightIdentifier}",
                    "Cost" : price.text,
                    "Stock" : stock.text,
                    "Display" : status,
                    "Category" : widget.data.Category
                  });

                  final HEADERS = {
                    "Content-type" : "application/json",
                    "Accept": "application/json"
                  };

                  final res = await http.put("https://trial-demo-app-heroku.herokuapp.com/updateVegetable/${widget.data.ProductCode}", body: req, headers: HEADERS);

                  if(res.statusCode == 200) {
                    _showMessage("Update Done!!");
                  }

                }
              },
              child: Center(
                child: Text("Product Update", style: TextStyle(fontSize: 22),),
              ),
            ),
          )

        ],
      ),
    );
  }

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message, style: TextStyle(fontSize: 12),));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
