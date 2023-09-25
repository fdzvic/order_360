import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'register_menu_state.dart';

class RegisterMenuController extends StateNotifier<RegisterMenuState> {
 
  RegisterMenuController(): super(RegisterMenuState());
}

final registerMenuController =
    StateNotifierProvider<RegisterMenuController, RegisterMenuState>(
        (ref) {
  return RegisterMenuController();
});