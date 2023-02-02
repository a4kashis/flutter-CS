import 'package:flutter/material.dart';
import 'package:flutter_authentication/dummy.dart';
import 'package:flutter_authentication/models/UserDetailsInfo.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Webview")),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemCount: response["data"].length,
        itemBuilder: (ctx, i) => ListTile(
          onTap: () {},
          title: Text(
            response["data"][i]['employee_name'],
          ),
          subtitle: Text("\u{20B9} ${response["data"][i]['employee_salary']}"),
        ),
        separatorBuilder: (ctx, i) => SizedBox(height: 8.0),
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
