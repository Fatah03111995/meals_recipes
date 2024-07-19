class UserModel {
  final String username;
  final String email;
  final List<String> favourite;
  final List<String> yourRecipies;

  const UserModel({
    required this.username,
    required this.email,
    this.favourite = const [],
    this.yourRecipies = const [],
  });
}
