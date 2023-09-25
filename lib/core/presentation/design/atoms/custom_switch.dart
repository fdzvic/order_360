import 'package:flutter/material.dart';
import 'package:order_360/core/presentation/design/tokens/colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool active;
  final Function onChange;
  const CustomSwitch({
    Key? key,
    required this.active,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragUpdate: (details) => onChange(),
        onTap: () => onChange(),
        child: Stack(alignment: Alignment.center, children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            height: 27,
            width: 46,
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(4),
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              left: active ? 25 : 6,
              child: Container(
                width: 21,
                height: 21,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: active
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : Icon(Icons.close, size: 16, color: colors.textColor),
              ))
        ]));
  }
}
