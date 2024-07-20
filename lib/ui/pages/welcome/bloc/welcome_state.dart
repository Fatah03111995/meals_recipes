// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WelcomeState extends Equatable {
  final int index;
  const WelcomeState(this.index);

  @override
  String toString() => 'WelcomeState(index: $index)';

  @override
  List<Object?> get props => [index];
}
