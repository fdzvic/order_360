import 'package:flutter/material.dart';
import 'package:order_360/core/presentation/design/atoms/custom_text.dart';
import 'package:order_360/core/presentation/design/tokens/colors.dart';
import 'package:order_360/core/presentation/utils/dimens_extension.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_controller.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_state.dart';
import 'package:order_360/features/restaurant_management/presentation/widgets/principal_menu_drawer.dart';

class BackgroundDrawer extends StatelessWidget {
  const BackgroundDrawer({
    super.key,
    required this.scaffoldKey,
    required this.controller,
    required this.state,
    required this.child,
    this.namePage,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final RestaurantManagementController controller;
  final RestaurantManagementState state;
  final String? namePage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        drawer: PrincipalMenuDrawer(
          controller: controller,
          state: state,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: context.height(.08),
                width: context.width(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: colors.orangeNormal,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () => scaffoldKey.currentState?.openDrawer(),
                        child: Icon(
                          Icons.menu,
                          size: 25,
                          color: colors.blackWhite,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomText(
                      namePage,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      textColor: colors.textColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: context.width(),
                height: context.height(.87),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
