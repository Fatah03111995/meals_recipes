// ignore_for_file: public_member_api_docs, sort_constructors_first
class SearchState {
  final String title;
  final List<String> listSearchIngredients;
  final bool isAdvanceSearchActive;
  final List filteredData;

  const SearchState({
    this.isAdvanceSearchActive = false,
    this.title = '',
    this.listSearchIngredients = const [],
    this.filteredData = const [],
  });

  SearchState copyWith({
    String? title,
    List<String>? listSearchIngredients,
    bool? isAdvanceSearchActive,
    List? filteredData,
  }) {
    return SearchState(
      title: title ?? this.title,
      listSearchIngredients:
          listSearchIngredients ?? this.listSearchIngredients,
      isAdvanceSearchActive:
          isAdvanceSearchActive ?? this.isAdvanceSearchActive,
      filteredData: filteredData ?? this.filteredData,
    );
  }
}
