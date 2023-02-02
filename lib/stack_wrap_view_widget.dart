import 'package:flutter/material.dart';
import 'package:flutter_authentication/dummy.dart';
import 'package:flutter_authentication/models/UserDetailsInfo.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StackWrapViewWidget extends StatefulWidget {
  const StackWrapViewWidget({Key? key}) : super(key: key);

  @override
  State<StackWrapViewWidget> createState() => _StackWrapViewWidgetState();
}

class _StackWrapViewWidgetState extends State<StackWrapViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Webview")),
      body: Wrap(
        runSpacing: 10.0,
        spacing: 10.0,
        children: [
          for (var i in response["data"])
            InkWell(
              onTap: () {
                if (selectedValues.contains(i)) {
                  selectedValues.remove(i);
                } else {
                  selectedValues.add(i);
                }
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color:
                      selectedValues.contains(i) ? Colors.amber : Colors.grey,
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  i['employee_name'],
                ),
              ),
            )
        ],
      ),
    );
  }
}

Widget cont(color) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        height: 80,
        width: 80,
        color: color,
      ),
    );
