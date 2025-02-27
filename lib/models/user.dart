class User {
  final String id;
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final bool isChef;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    this.isChef = false,
  });
}