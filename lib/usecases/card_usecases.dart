import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../src/widgets/cards.dart';

@widgetbook.UseCase(name: 'Tarjeta Básica', type: RSCard)
Widget buildBasicCardUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: RSCard(
        child: const Text('Información general de la mesa 4.'),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Con Imagen Header', type: RSCard)
Widget buildHeaderCardUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: RSCard(
        headerHeight: 120,
        headerImage: Container(
          color: Colors.orange.shade200,
          child: const Center(child: Icon(Icons.fastfood, size: 48, color: Colors.white)),
        ),
        child: const Text('Hamburguesa Doble Especial'),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Interactiva (Hover/Tap)', type: RSCard)
Widget buildInteractiveCardUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: RSCard(
        onTap: () {},
        elevation: 2.0,
        child: const Text('Toca esta tarjeta para ver detalles del pedido.'),
      ),
    ),
  );
}