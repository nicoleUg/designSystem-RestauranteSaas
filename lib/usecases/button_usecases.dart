// lib/usecases/button_usecases.dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Importa tu componente
import '../src/widgets/buttons.dart';

@widgetbook.UseCase(name: 'Filled (Primario)', type: RSButton)
Widget buildFilledButtonUseCase(BuildContext context) {
  return Center(
    child: RSButton.filled(
      label: 'Crear Pedido',
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Outlined', type: RSButton)
Widget buildOutlinedButtonUseCase(BuildContext context) {
  return Center(
    child: RSButton.outlined(
      label: 'Cancelar',
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Loading State', type: RSButton)
Widget buildLoadingButtonUseCase(BuildContext context) {
  return Center(
    child: RSButton.filled(
      label: 'Guardando...',
      isLoading: true,
      onPressed: () {},
    ),
  );
}