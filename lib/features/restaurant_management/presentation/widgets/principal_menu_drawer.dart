// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:order_360/core/presentation/design/atoms/custom_text.dart';
import 'package:order_360/core/presentation/design/tokens/colors.dart';
import 'package:order_360/core/presentation/utils/dimens_extension.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_controller.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_state.dart';

class PrincipalMenuDrawer extends StatelessWidget {
  const PrincipalMenuDrawer({
    super.key,
    required this.controller,
    required this.state,
  });

  final RestaurantManagementController controller;
  final RestaurantManagementState state;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width(.8),
      child: ListView(
        children: [
          Container(
            height: context.height(.12),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'Menú principal',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  textColor: colors.blackDark,
                ),
                CustomText(
                  'Restaurante',
                  fontSize: 16,
                  textColor: colors.blackDark,
                ),
              ],
            ),
          ),
          OptionsDrawer(
            label: "Mesas",
            icon: Icons.table_bar_rounded,
            selected: state.listStatesMenuButtons!.first,
            onTap: () => controller.selectedButtonPrincipalMenu(0),
          ),
          OptionsDrawer(
            label: "Ingresar menú",
            icon: Icons.edit_document,
            selected: state.listStatesMenuButtons![1],
            onTap: () => controller.selectedButtonPrincipalMenu(1),
          ),
          OptionsDrawer(
            label: "Carta",
            icon: Icons.feed,
            selected: state.listStatesMenuButtons![2],
            onTap: () => controller.selectedButtonPrincipalMenu(2),
          ),
          OptionsDrawer(
            label: "Reporte de caja",
            icon: Icons.paid,
            selected: state.listStatesMenuButtons![3],
            onTap: () => controller.selectedButtonPrincipalMenu(3),
          ),
        ],
      ),
    );
  }
}

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer(
      {super.key,
      required this.selected,
      required this.label,
      required this.icon,
      required this.onTap});

  final bool selected;
  final String label;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        Navigator.of(context).pop();
      },
      child: Container(
        height: context.height(.06),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? colors.orangeDark.withOpacity(0.1) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? colors.orangeNormal : colors.blackDarkHover,
            ),
            const SizedBox(width: 20),
            CustomText(
              label,
              fontSize: 16,
              textColor: selected ? colors.orangeNormal : colors.blackDarkHover,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
