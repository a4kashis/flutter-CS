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
    setState(() => _isLoading = true);
    await Future.delayed(Duration(seconds: 2));
    print("email: ${_email.text}, password: ${_password.text} ");
    if (_email.text == defaultEmail && _password.text == defaultPassword) {
      print("Login Successful");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login Successful!'),
      ));
    } else {
      print("Login Unsuccessful");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login Unsuccessful!'),
      ));
    }
    setState(() => _isLoading = false);
  }
}

const defaultEmail = "test@test.in";
const defaultPassword = "test";
