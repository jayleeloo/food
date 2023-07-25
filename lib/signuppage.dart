import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // ignore: prefer_final_fields

  final TextEditingController _firstnamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswardcontroller =
      TextEditingController();
  bool viewpassword = false;
  bool checkbox = false;
  @override
  void dispose() {
    super.dispose();
    _firstnamecontroller.text;
    _emailcontroller.text;
    _passwordcontroller.text;
    _confirmpasswardcontroller.text;
  }

  void _viewpassword() {
    setState(() {
      viewpassword = !viewpassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 229, 60, 116),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'SignUp',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                      controller: _firstnamecontroller,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)))),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)))),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                      controller: _passwordcontroller,
                      obscureText: viewpassword,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: _viewpassword,
                              child: Icon(viewpassword
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)))),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _confirmpasswardcontroller,
                    obscureText: viewpassword,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: _viewpassword,
                          child: Icon(viewpassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                ),
              ),
            


            ]),
          ),
        ));
  }
}
