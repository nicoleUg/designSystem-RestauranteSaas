import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../src/widgets/chips.dart';

@widgetbook.UseCase(name: 'Seleccionado', type: RSChoiceChip)
Widget buildSelectedChipUseCase(BuildContext context) {
  return Center(
    child: RSChoiceChip(
      label: 'Platos Fuertes',
      selected: true,
      icon: const Icon(Icons.restaurant),
      onSelected: (val) {},
    ),
  );
}

@widgetbook.UseCase(name: 'Inactivo / No seleccionado', type: RSChoiceChip)
Widget buildUnselectedChipUseCase(BuildContext context) {
  return Center(
    child: RSChoiceChip(
      label: 'Bebidas',
      selected: false,
      onSelected: (val) {},
    ),
  );
}