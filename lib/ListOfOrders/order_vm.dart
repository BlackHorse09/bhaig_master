import 'dart:convert';
import 'package:bhaigmaster/Utils/app_models.dart';
import 'package:bhaigmaster/Utils/connection_helper.dart';
import 'package:http/http.dart' as http;

class OrderAPI {
  ConnectionHelper mCH;

  OrderAPI() {
    mCH = ConnectionHelper.getInstance();
  }


  Future<OrderDetailsModel> getOrderData() async {
    OrderDetailsModel res_d;

    var Headers = {
      "Content-type" : "application/json",
      "Accept": "application/json",
    };

    bool con = await mCH.checkConnection();
//    bool con = true;

    if(con) {
      try {

        final res = await http.get('http://trial-demo-app-heroku.herokuapp.com/admin/getAllOrders', headers: Headers);

        switch (res.statusCode) {
          case 200:
            final j_data = json.decode(res.body);
            print('Res ---> ${res.body}');
            res_d = OrderDetailsModel.fromJson(j_data);
            print(res_d);
            return res_d;
            break;

          default:
            print("Default");
        }
      } catch (err) {
        print(err);
      }
    } else {
      print("No internet");
    }
  }

}