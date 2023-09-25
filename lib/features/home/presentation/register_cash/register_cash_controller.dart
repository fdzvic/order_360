import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'register_cash_state.dart';

class RegisterCashController extends StateNotifier<RegisterCashState> {
 
  RegisterCashController(): super(RegisterCashState());
}

final registerCashController =
    StateNotifierProvider<RegisterCashController, RegisterCashState>(
        (ref) {
  return RegisterCashController();
});