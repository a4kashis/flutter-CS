import 'package:flutter/material.dart';
import 'package:flutter_authentication/models/UserDetailsInfo.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsInfo info =
        ModalRoute.of(context)!.settings.arguments as UserDetailsInfo;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("THIS is a user:${info.name}"),
          ],
        ),
      ),
    );
  }
}
