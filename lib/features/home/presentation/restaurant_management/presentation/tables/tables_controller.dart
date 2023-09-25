import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tables_state.dart';

class TablesController extends StateNotifier<TablesState> {
 
  TablesController(): super(TablesState());
}

final tablesController =
    StateNotifierProvider<TablesController, TablesState>(
        (ref) {
  return TablesController();
});