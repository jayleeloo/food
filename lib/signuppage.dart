import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // ignore: prefer_final_fields

  final TextEditingController _firstnamecontroller = TextEditingController();
  final TextEditingController _secondnamecontroller = TextEditingController();
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
    _secondnamecontroller.text;
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
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 39, 104),
                ),
                child: Text('Draw List'),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                title: const Text('SignUp'),
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
              ListTile(
                title: const Text('Orders'),
                onTap: () {
                  Navigator.pushNamed(context, '/orders');
                },
              ),
              ListTile(
                  title: const Text('Login'),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  }),
            ],
          ),
        ),
        appBar: AppBar(
          shadowColor: Colors.teal,
        ),
        backgroundColor: const Color.fromARGB(255, 229, 60, 116),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        controller: _secondnamecontroller,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            labelText: 'Second Name',
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
                              Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final firstname = _firstnamecontroller.text;
                      final secondname = _secondnamecontroller.text;
                      final email = _emailcontroller.text;
                      final password = _passwordcontroller.text;
                
                      try {
                        final AuthResponse res = await supabase.auth.signUp(
                          email: email,
                          password: password,
                        );
                        Navigator.pushNamed(context, '/login');
                
                        final Session session = res.session!;
                        final User user = res.user!;
                
                        // Perform any additional actions after successful sign-up if needed.
                      } catch (e) {
                        // Handle sign-up errors here if necessary.
                        print('Error during sign-up: $e');
                      }
                    },
                    child: Text('SignUp'),
                  ),
                              ),
                              TextButton(
                  child: Text('Already own an account'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                              )
                            ]),
                ),
          ),
        ));
  }
}
