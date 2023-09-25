import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantManagementRepository {
 
}

final restaurantManagementRepositoryProvider = Provider.autoDispose<RestaurantManagementRepository>(
  (ref) => RestaurantManagementRepository(),
);