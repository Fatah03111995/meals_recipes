// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  UserModel copyWith({
    String? username,
    String? email,
    List<String>? favourite,
    List<String>? yourRecipies,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      favourite: favourite ?? this.favourite,
      yourRecipies: yourRecipies ?? this.yourRecipies,
    );
  }

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, favourite: $favourite, yourRecipies: $yourRecipies)';
  }
}
