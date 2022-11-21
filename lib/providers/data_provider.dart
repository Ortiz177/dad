import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _ProviderData {
  List<dynamic> Claves = [];
  String Clavetesteo = "1";
  _ProviderData(String valor) {
    LoadData(valor);
  }

  LoadData(String valor) {
    var value = rootBundle.loadString('data/users.json').then((value) {
      List<dynamic> data = json.decode(value);
      data.forEach((k) => Claves.add(k["pass"]));
      Claves.forEach((element) {
        print(element);
      });
    });
  }
}

usersProvider(String valor) {
  return new _ProviderData(valor);
}
