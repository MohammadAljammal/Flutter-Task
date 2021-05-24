import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String tagName;

  const TagWidget({Key key, this.tagName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4,right: 4,top: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0) //
              ),
          color: Colors.pink,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
          child: Text(
            tagName,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ));
  }
}
