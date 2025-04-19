import 'package:bikex/models/user.dart';

class UserProvider {
  List<User> users=[
    User(id: "", name: "Iyad", email: "", address: ["123 lab office","122 lab office"], phoneNumber: "0000123123")
  ];

  User demoUser() => users[0];
}