import 'package:bhaigmaster/ListOfOrders/list_of_order.dart';
import 'package:bhaigmaster/ListOfThings/list_of_things_master.dart';
import 'package:flutter/material.dart';

class HomePageMaster extends StatefulWidget {
  @override
  _HomePageMasterState createState() => _HomePageMasterState();
}

class _HomePageMasterState extends State<HomePageMaster> {

  double h,w;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bhaig"),
      ),

      body: ListView(
        children: <Widget>[

          Container(
            height: h*0.15,
            width: w,
            child: Center(
              child: Image.asset('assets/logo.jpeg', fit: BoxFit.cover,),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5.0,
              color: Colors.yellowAccent.shade400,
              child: Column(
                children: <Widget>[
                  Container(
                      width: w,
                      padding: EdgeInsets.only(top: 16.0),
                      child: Center(child: Text("ADMIN", style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),))),
                  SizedBox(height: 16.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            settings: RouteSettings(name: '/list_of_order'),
                            pageBuilder: (c, a1, a2) => ListOfOrder(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: Container(
                        width: w,
                        height: h*0.20,
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Order Confirmation")
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                settings: RouteSettings(name: '/list_of_order'),
                                pageBuilder: (c, a1, a2) => ListOfThingsMaster(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 500),
                              ),
                            );
                          },
                          child: Container(
                            height: h*0.2,
                            width: w/2-36,
                            color: Colors.white,
                            child: Center(
                              child: Text("Vegetables"),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0,),
                        Container(
                          height: h*0.2,
                          width: w/2 - 36 ,
                          color: Colors.white,
                          child: Center(
                            child: Text("Fruits"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: h*0.2,
                          width: w/2-36,
                          color: Colors.white,
                          child: Center(
                            child: Text("Milk Products"),
                          ),
                        ),
                        SizedBox(width: 16.0,),
                        Container(
                          height: h*0.2,
                          width: w/2 - 36 ,
                          color: Colors.white,
                          child: Center(
                            child: Text("Bakery and Snacks"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0,),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
