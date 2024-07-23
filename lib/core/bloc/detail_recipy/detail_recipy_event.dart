import 'package:meals_recipes/core/data/models/meals_model.dart';

abstract class DetailRecipyEvent {
  const DetailRecipyEvent();
}

abstract class DetailRecipyEventPushData extends DetailRecipyEvent {
  final Meal data;

  const DetailRecipyEventPushData({required this.data});
}
