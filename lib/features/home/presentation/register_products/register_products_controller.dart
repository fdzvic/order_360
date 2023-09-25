import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'register_products_state.dart';

class RegisterProductsController extends StateNotifier<RegisterProductsState> {
 
  RegisterProductsController(): super(RegisterProductsState());
}

final registerProductsController =
    StateNotifierProvider<RegisterProductsController, RegisterProductsState>(
        (ref) {
  return RegisterProductsController();
});