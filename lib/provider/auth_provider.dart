import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool load) {
    _loading = load;
    notifyListeners();
  }

  void loginWith(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password},
          headers: {'x-api-key': 'reqres-free-v1'});
      if (response.statusCode == 200) {
        setLoading(false);
        print(response.body);
      } else {
        setLoading(false);
        print('Fail');
      }
    } catch (e) {
      setLoading(false);
      print('${e.toString()}');
    }
  }
}
