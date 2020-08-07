import 'package:bhaigmaster/ListOfThings/list_api.dart';
import 'package:bhaigmaster/ProductUpdate/product_update.dart';
import 'package:bhaigmaster/Utils/app_models.dart';
import 'package:bhaigmaster/Utils/singleton.dart';
import 'package:flutter/material.dart';


class ListOfThingsMaster extends StatefulWidget {
  @override
  _ListOfThingsMasterState createState() => _ListOfThingsMasterState();
}

class _ListOfThingsMasterState extends State<ListOfThingsMaster> {

  TextEditingController search = new TextEditingController();
  List<CategrotyData> displayData = [];
  bool once = true;
  GetListAPI getListAPI;
  Future<CategrotyModel> mF;
  double h,w;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AAAppSingleton aap;

  @override
  void initState() {
    aap = AAAppSingleton();
    getListAPI = GetListAPI();
    mF = getListAPI.GetListItemsFromAPI();
    super.initState();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: FutureBuilder(
            initialData: null,
            future: mF,
            builder: (context, snap) => _checkAPIData(context, snap)));
  }
  Widget _checkAPIData(BuildContext c, AsyncSnapshot snap) {
    //ConnectionState.active = snap.connectionState
    if (snap?.hasData) {
      // API
      // 404
      // catch
      CategrotyModel _d = snap?.data;

      if (_d.status == 200 ?? 100) {
        // API true
        return _buildList(c, _d);
      } else if (_d?.is_loading) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
            backgroundColor: Colors.white,
            //backgroundColor: Theme.of(context).primaryColor,
//          appBar: AppBarr(),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(_d.Message),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                      child: InkWell(
                          splashColor: Theme.of(context).primaryColor,
                          onTap: (){
                            _d.is_loading = true;
                            mF = getListAPI.GetListItemsFromAPI();
                          },
                          child: Container(
                              decoration: new BoxDecoration(
                                  border: new Border.all(color: Theme.of(context).primaryColor, width: 0.5),
                                  borderRadius: new BorderRadius.circular(4)),
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 10.0,right: 10.0),
                              child: Text('Retry', style: TextStyle(color: Theme.of(context).primaryColor),))),
                    )
                  ],
                ),
              ),
            )
        );
      }
    } else {
      // initial loading
      return Center(child: CircularProgressIndicator());
    }
  }
  Widget _buildList(BuildContext c, CategrotyModel d) {
    if(once) {
      displayData = d.data;
      once = false;
    }
    return Scaffold(

      floatingActionButton: aap.addCartObj.length != 0 ? FloatingActionButton.extended(
        onPressed: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }

        },
        icon: Icon(Icons.payment),
        label: Text("Next"),
      ) : Container(),

      appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 8,right: 8),

            child: TextField(
              controller: search,
              onChanged: (text) {
                text = text.toLowerCase();
                setState(() {
                  displayData = d.data.where((element) {
                    var nameVeg = element.Name.toLowerCase();
                    //return nameVeg.contains(text);
                    if(nameVeg.contains(text)) {
                      return true;
                    } else {
                      var tagName = element.Tag.toString().toLowerCase();
                      if(tagName.contains(text)) {
                        return true;
                      } else {
                        return false;
                      }
                    }
                  }).toList();
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Order something'
              ),
            ),
          ),

          flexibleSpace: Container(),
          bottom: PreferredSize(preferredSize: Size(double.infinity, 10), child: Container(),)

      ),
      body: GestureDetector(
        onTap: (){
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: ListView.builder(
            itemCount: displayData.length,
            itemBuilder: (context, int i){
              return Column(
                children: <Widget>[
                  Container(
                    height: 80.0,

                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      //color: Color(0xff),
                      child: Padding(
                          padding: const EdgeInsets.only(right : 8.0, top: 8.0, bottom: 8.0, left: 0.0),
                          child: ListTile(
                              onTap: () {
                                FocusScopeNode currentFocus = FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }

                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    settings: RouteSettings(name: '/product_update'),
                                    pageBuilder: (c, a1, a2) => ProductUpdate(
                                      data: displayData[i],
                                    ),
                                    transitionsBuilder: (c, anim, a2, child) =>
                                        FadeTransition(opacity: anim, child: child),
                                    transitionDuration: Duration(milliseconds: 500),
                                  ),
                                );
//                                var results = await Navigator.push(
//                                  context,
//                                  PageRouteBuilder(
//                                    settings: RouteSettings(name: '/add_to_cart'),
//                                    pageBuilder: (c, a1, a2) => AddToCartPage(
//                                        weightIdentifier : displayData[i].WeightIdentifier,
//                                        name : displayData[i].Name,
//                                        cost : displayData[i].Cost,
//                                        category : displayData[i].Category,
//                                        image : displayData[i].ListImage,
//                                        stock : displayData[i].Stock,
//                                        p_id : displayData[i].ProductCode,
//                                        display : displayData[i].Display
//                                    ),
//                                    transitionsBuilder: (c, anim, a2, child) =>
//                                        FadeTransition(opacity: anim, child: child),
//                                    transitionDuration: Duration(milliseconds: 500),
//                                  ),
//
                              },
                              title: Text(displayData[i].Name),
                              trailing: Icon(Icons.edit),
                              leading: Image.asset("assets/demo.jpeg", fit: BoxFit.cover,)
//                          leading: CachedNetworkImage(
//                            imageUrl: '${displayData[i].ListImage}',
//                            placeholder: (context, url) => CircularProgressIndicator(),
//                            errorWidget: (context, url, error) => Icon(Icons.error),
//                          ),
                          )
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
