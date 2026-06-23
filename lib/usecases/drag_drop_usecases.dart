import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../src/widgets/drag_drop_widgets.dart';

@widgetbook.UseCase(name: 'Columna Kanban con Pedidos', type: RSOrderKanbanColumn)
Widget buildKanbanColumnUseCase(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 320,
      height: 500,
      child: RSOrderKanbanColumn(
        title: 'En Preparación',
        accentColor: Colors.orange,
        onOrderDropped: (id) {},
        children: [
          RSDraggableOrderCard(
            orderId: 'ORD-001',
            child: const Text('Mesa 4 - 2x Hamburguesas'),
          ),
          RSDraggableOrderCard(
            orderId: 'ORD-002',
            child: const Text('Mesa 7 - 1x Pizza Familiar'),
          ),
        ],
      ),
    ),
  );
}