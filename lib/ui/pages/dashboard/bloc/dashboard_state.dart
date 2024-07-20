// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  final int index;
  const DashboardState({
    this.index = 0,
  });

  @override
  List<Object?> get props => [index];
}
