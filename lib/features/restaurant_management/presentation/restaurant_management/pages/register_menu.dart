import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:order_360/core/presentation/design/atoms/custom_primary_button.dart';
import 'package:order_360/core/presentation/design/atoms/custom_text.dart';
import 'package:order_360/core/presentation/design/tokens/colors.dart';
import 'package:order_360/core/presentation/utils/dimens_extension.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_controller.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_state.dart';

class RegisterMenu extends StatelessWidget {
  const RegisterMenu({
    super.key,
    required this.controller,
    required this.state,
  });

  final RestaurantManagementController controller;
  final RestaurantManagementState state;

  @override
  Widget build(BuildContext context) {
    if (state.menuOfDay == null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.width(),
              height: context.height(.4),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.fromBorderSide(
                      BorderSide(color: colors.blackLightActive)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(2, 4))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Menú del dia",
                    textColor: colors.blackDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    "Entrada:",
                    textColor: colors.blackDark,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    "Mazamorra",
                    textColor: colors.blackDark,
                  ),
                  CustomText(
                    "Sopa de pasta",
                    textColor: colors.blackDark,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  CustomText(
                    "Proteina:",
                    textColor: colors.blackDark,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    "Pollo guisado",
                    textColor: colors.blackDark,
                  ),
                  CustomText(
                    "Res a la plancha",
                    textColor: colors.blackDark,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  CustomText(
                    "Acompañantes:",
                    textColor: colors.blackDark,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    "Ullucos",
                    textColor: colors.blackDark,
                  ),
                  CustomText(
                    "Lentejas",
                    textColor: colors.blackDark,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),
            CustomPrimaryButton(
              text: "Ingresar menú del día",
              backgroundColor: colors.orangeNormal,
              onPressed: () {},
            ),
            const SizedBox(height: 5),
            CustomPrimaryButton(
              text: "Eliminar menú",
              textColor: colors.blackDark,
              onPressed: () {},
              buttonType: ButtonType.secondary,
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrimaryButton(
              text: "Ingresar menú del día",
              backgroundColor: colors.orangeNormal,
              onPressed: () {},
            )
          ],
        ),
      );
    }
  }
}
