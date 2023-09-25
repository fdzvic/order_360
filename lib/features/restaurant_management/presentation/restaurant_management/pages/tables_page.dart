import 'package:flutter/material.dart';
import 'package:order_360/core/presentation/design/atoms/custom_text.dart';
import 'package:order_360/core/presentation/design/tokens/colors.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_controller.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_state.dart';

class TablePage extends StatelessWidget {
  const TablePage({
    super.key,
    required this.controller,
    required this.state,
  });

  final RestaurantManagementController controller;
  final RestaurantManagementState state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: state.servicesTables?.length,
      itemBuilder: (context, index) {
        if (state.servicesTables != null) {
          return InkWell(
            onTap: () => print("mesa ${index + 1} seleccionada"),
            child: Card(
              elevation: 2.0,
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      state.servicesTables?[index].tableNumber,
                      textColor: colors.blackDark,
                    ),
                    const Icon(
                      Icons.table_bar_rounded,
                      size: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              state.servicesTables![index].available!
                                  ? Colors.green
                                  : Colors.red,
                          maxRadius: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
