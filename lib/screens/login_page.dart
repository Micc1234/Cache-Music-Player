import 'package:cache_music_player/screens/first_page.dart';
import 'package:cache_music_player/screens/register.page.dart';
import 'package:flutter/material.dart';
import 'package:cache_music_player/models/user_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void _login() {
    String email = emailC.text;
    String password = passwordC.text;

    bool valid = loginAction(email, password);

    if (valid) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FirstPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email or password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstPage()));
                },
                child: Text("Shortcut")),
            Text(
              "Login",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                TextField(
                  controller: emailC,
                  decoration: InputDecoration(
                      hintText: "Email", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordC,
                  decoration: InputDecoration(
                      hintText: "Password", border: OutlineInputBorder()),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    child: Text("Login"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text("Register"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
