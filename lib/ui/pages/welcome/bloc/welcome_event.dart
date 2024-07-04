// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class WelcomeEvent {
  const WelcomeEvent();
}

class ChangeIndex extends WelcomeEvent {
  final int index;
  ChangeIndex({
    required this.index,
  });
}
