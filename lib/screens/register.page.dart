import 'package:cache_music_player/models/user_data.dart';
import 'package:cache_music_player/screens/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  String errorMessage = "";

  void _register() {
    String username = usernameC.text;
    String email = emailC.text;
    String password = passwordC.text;

    setState(() {
      errorMessage = "";
    });

    //check empty
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = "Username, email, or password cannot be empty.";
      });
      return;
    }

    //check exist
    bool userExists =
        users.any((user) => user.username == username || user.email == email);

    if (userExists) {
      setState(() {
        errorMessage = "User with the same username, or email already exists.";
      });
      return;
    }

    //success
    addUser(username, email, password);
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
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
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
