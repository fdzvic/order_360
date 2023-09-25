import 'package:order_360/features/restaurant_management/domain/menu_of_day.dart';
import 'package:order_360/features/restaurant_management/domain/service_tables.dart';

class RestaurantManagementState {
  final List<bool>? listStatesMenuButtons;
  final int? selectedValuePage;
  final String? namePage;
  final List<ServiceTables>? servicesTables;
  final MenuOfDay? menuOfDay;

  RestaurantManagementState({
    this.listStatesMenuButtons,
    this.selectedValuePage,
    this.namePage,
    this.servicesTables,
    this.menuOfDay,
  });

  RestaurantManagementState copyWith({
    List<bool>? listStatesMenuButtons,
    int? selectedValuePage,
    String? namePage,
    List<ServiceTables>? servicesTables,
    MenuOfDay? menuOfDay,
  }) {
    return RestaurantManagementState(
        listStatesMenuButtons:
            listStatesMenuButtons ?? this.listStatesMenuButtons,
        selectedValuePage: selectedValuePage ?? this.selectedValuePage,
        namePage: namePage ?? this.namePage,
        servicesTables: servicesTables ?? this.servicesTables,
        menuOfDay: menuOfDay ?? this.menuOfDay);
  }
}
