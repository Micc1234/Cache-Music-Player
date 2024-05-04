import 'package:cache_music_player/models/user_class_model.dart';

List<User> users = [
  User(username: "user1", email: "user1@gmail.com", password: "pwd1"),
  User(username: "user2", email: "user2@gmail.com", password: "pwd2"),
];

bool loginAction(String email, String password) {
  for (User user in users) {
    if (user.email == email && user.password == password) {
      return true;
    }
  }
  return false;
}

void addUser(String username, String email, String password) {
  users.add(User(username: username, email: email, password: password));
}
