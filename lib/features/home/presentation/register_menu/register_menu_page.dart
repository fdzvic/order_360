import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'register_menu_controller.dart';


class RegisterMenuPage extends ConsumerWidget {
  const RegisterMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(registerMenuController.notifier);
    var state = ref.watch(registerMenuController);
    return Container();
  }
}