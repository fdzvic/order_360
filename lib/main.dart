import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_360/core/presentation/design/tokens/colors.dart';
import 'package:order_360/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor:
        colors.orangeNormal, // Cambia el color de la barra de estado aquí
  ));

  runApp(const ProviderScope(child: MyApp()));
}
