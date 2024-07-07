import 'package:flutter/material.dart';
import 'package:cache_music_player/models/data_provider.dart';
import 'package:cache_music_player/screens/login_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void _register() {
    String username = usernameC.text;
    String email = emailC.text;
    String password = passwordC.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Username, email, or password cannot be empty."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final provider = Provider.of<DataProvider>(context, listen: false);
    bool userExists = provider.users
        .any((user) => user.username == username || user.email == email);

    if (userExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User with the same username or email already exists."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Success: Add user and navigate to LoginPage
    provider.addUser(username, email, password);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                TextField(
                  controller: usernameC,
                  decoration: InputDecoration(
                      hintText: "Username", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
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
                      _register();
                    },
                    child: Text("Register"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
