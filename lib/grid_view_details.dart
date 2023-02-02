import 'package:flutter/material.dart';
import 'package:flutter_authentication/dummy.dart';
import 'package:flutter_authentication/models/UserDetailsInfo.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Webview")),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
        ),
        scrollDirection: Axis.horizontal,
        children: [
          cont,
          cont,
          cont,
          cont,
          cont,
          cont,
          cont,
          cont,
          cont,
          cont,
          cont,
        ],
      ),
    );
  }
}

Widget cont = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  child: Container(
    height: 80,
    width: 80,
    color: Colors.blueAccent,
  ),
);
