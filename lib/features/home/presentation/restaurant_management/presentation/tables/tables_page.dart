import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'tables_controller.dart';


class TablesPage extends ConsumerWidget {
  const TablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(tablesController.notifier);
    var state = ref.watch(tablesController);
    return Container();
  }
}
