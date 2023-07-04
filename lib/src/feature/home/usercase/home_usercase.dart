import '../model/restaurant_model.dart';

abstract class IHome {
  Future<List<Restaurant>> parseJson();
}
