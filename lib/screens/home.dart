import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_favorites/delegates/data_search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Container(
          height: 65.0,
          child: Image.asset("images/logo_dark.png"),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
            icon: Icon(
              Icons.star,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: DataSearch());
              print(result);
            },
          )
        ],
      ),
      backgroundColor: Colors.black38,
      body: Container(),
    );
  }
}
