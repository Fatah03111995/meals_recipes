// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:meals_recipes/lib.dart';

class ThemeState extends Equatable {
  final MyTheme modeThemes;
  const ThemeState({
    required this.modeThemes,
  });

  @override
  List<Object?> get props => [modeThemes];
}
