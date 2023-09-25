import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/pages/register_menu.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/pages/tables_page.dart';

import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_controller.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_state.dart';
import 'package:order_360/features/restaurant_management/presentation/widgets/background_drawer.dart';

class RestaurantMenagementPage extends ConsumerStatefulWidget {
  const RestaurantMenagementPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TablesPageState();
}

class _TablesPageState extends ConsumerState<RestaurantMenagementPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await ref.watch(restaurantManagementController.notifier).initData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(restaurantManagementController.notifier);
    var state = ref.watch(restaurantManagementController);

    return BackgroundDrawer(
      scaffoldKey: scaffoldKey,
      controller: controller,
      namePage: state.namePage,
      state: state,
      child: page(
        value: state.selectedValuePage ?? 0,
        controller: controller,
        state: state,
      ),
    );
  }

  Widget page(
      {required int value,
      required RestaurantManagementController controller,
      required RestaurantManagementState state}) {
    switch (value) {
      case 0:
        return TablePage(controller: controller, state: state);
      case 1:
        return RegisterMenu(
          controller: controller,
          state: state,
        );
      case 2:
        return Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            )
          ],
        );
      case 3:
        return Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.green,
            )
          ],
        );

      default:
        return Column();
    }
  }
}
