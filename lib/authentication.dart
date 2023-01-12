import 'package:flutter/material.dart';

class AuthenticationScreeen extends StatefulWidget {
  AuthenticationScreeen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreeen> createState() => _AuthenticationScreeenState();
}

class _AuthenticationScreeenState extends State<AuthenticationScreeen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isLoading = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Flutter Authentication"),
          const SizedBox(height: 60),
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(hintText: "Email"),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: _password,
            obscureText: _isObscure,
            decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                    print(_isObscure);
                  },
                )),
          ),
          const SizedBox(height: 60),
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(onPressed: login, child: Text("LOGIN"))
        ]),
      ),
    );
  }

  login() async {
    String email = _email.text.trim();
    String password = _password.text.trim();

    setState(() => _isLoading = true);
    await Future.delayed(Duration(seconds: 3)); //this is an api call
    setState(() => _isLoading = false);

    if (defaultEmail == email && password == defaultPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login Successful!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login Unuccessful!'),
      ));
    }
  }
}

const defaultEmail = "test@test.in";
const defaultPassword = "test";
