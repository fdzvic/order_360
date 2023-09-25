import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'register_products_controller.dart';


class RegisterProductsPage extends ConsumerWidget {
  const RegisterProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(registerProductsController.notifier);
    var state = ref.watch(registerProductsController);
    return Container();
  }
}