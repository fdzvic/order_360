import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'register_cash_controller.dart';


class RegisterCashPage extends ConsumerWidget {
  const RegisterCashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(registerCashController.notifier);
    var state = ref.watch(registerCashController);
    return Container();
  }
}