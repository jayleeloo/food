import 'package:flutter/material.dart';
import 'package:food/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
   final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
   bool viewpassword = false;
   @override
     void dispose() {
    super.dispose();
    _emailcontroller.text;
    _passwordcontroller.text;

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
                Navigator.pushNamed(context, '/login');}
            ),
          
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Logins'),
      ),
      body:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              
               SizedBox(
                child: Padding(
                  padding:  const EdgeInsets.all(16.0),
                  child: TextField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)
                              )
                              )
                              )
                              ,
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
            Center(
              child:  ElevatedButton(
              
              onPressed: () async {
                final email = _emailcontroller.text;
                final password = _passwordcontroller.text;

final AuthResponse res = await supabase.auth.signInWithPassword(
  email: email,
  password: password,
);
 Navigator.pushNamed(context, '/home');
final Session? session = res.session;
final User? user = res.user;
              },
              child: Text('login'),
                      ),
            ),
              ],
      ),
    );
  }
}