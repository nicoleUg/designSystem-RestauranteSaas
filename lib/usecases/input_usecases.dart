import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../src/widgets/inputs.dart';

@widgetbook.UseCase(name: 'Texto Estándar', type: RSTextField)
Widget buildStandardInputUseCase(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: RSTextField(
        labelText: 'Nombre del Cliente',
        hintText: 'Ej. Juan Pérez',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Contraseña con Iconos', type: RSTextField)
Widget buildPasswordInputUseCase(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: RSTextField(
        labelText: 'Contraseña',
        obscureText: true,
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: Icon(Icons.visibility_off),
      ),
    ),
  );
}