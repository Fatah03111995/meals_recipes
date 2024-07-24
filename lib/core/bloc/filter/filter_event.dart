// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilterEvent {
  const FilterEvent();
}

class FilterEventGlutenFree extends FilterEvent {
  final bool isGlutenFree;
  const FilterEventGlutenFree({required this.isGlutenFree});
}

class FilterEventLactoseFree extends FilterEvent {
  final bool isLactoseFree;
  const FilterEventLactoseFree({required this.isLactoseFree});
}

class FilterEventVegan extends FilterEvent {
  final bool isVegan;
  const FilterEventVegan({required this.isVegan});
}

class FilterEventVegetarian extends FilterEvent {
  final bool isVegetarian;
  const FilterEventVegetarian({required this.isVegetarian});
}
