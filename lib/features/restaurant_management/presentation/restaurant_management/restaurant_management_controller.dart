import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_360/features/restaurant_management/domain/service_tables.dart';
import 'restaurant_management_state.dart';

class RestaurantManagementController
    extends StateNotifier<RestaurantManagementState> {
  RestaurantManagementController() : super(RestaurantManagementState());

  initData() {
    final List<ServiceTables> tables = List.generate(
        12,
        (index) =>
            ServiceTables(tableNumber: "Mesa: ${index + 1}", available: true));
    state = state.copyWith(
      listStatesMenuButtons: [true, false, false, false],
      selectedValuePage: 0,
      namePage: "Mesas",
      servicesTables: tables,
    );
  }

  selectedButtonPrincipalMenu(int value) {
    state = state.copyWith(
      selectedValuePage: value,
      listStatesMenuButtons: [
        value == 0,
        value == 1,
        value == 2,
        value == 3,
      ],
      namePage: selectedNamePage(value),
    );
  }

  String selectedNamePage(int value) {
    String name;
    switch (value) {
      case 0:
        name = "Mesas";
        break;
      case 1:
        name = "Ingresar menú";
        break;
      case 2:
        name = "Carta";
        break;
      case 3:
        name = "Reporte de caja";
        break;
      default:
        name = "";
    }

    return name;
  }
}

final restaurantManagementController = StateNotifierProvider<
    RestaurantManagementController, RestaurantManagementState>((ref) {
  return RestaurantManagementController();
});
