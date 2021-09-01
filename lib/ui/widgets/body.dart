import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container myBody() {

  return Container(
    child: Card(
      child: Row(
        children: <Widget>[
          Text("Bugünlük içilen su miktarı: "),
          Text(""),
        ],
      ),
    ),
  );
}
