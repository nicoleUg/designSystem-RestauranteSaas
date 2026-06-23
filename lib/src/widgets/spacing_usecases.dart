import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
// IMPORT CORREGIDO
import '../tokens/tokens.dart';

// Widget ficticio para agrupar en el menú lateral
class Espaciado extends StatelessWidget {
  const Espaciado({super.key});
  @override Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Escala de Espaciado', type: Espaciado)
Widget buildSpacingUseCase(BuildContext context) {
  final List<_SpacingItem> spacings = [
    const _SpacingItem(name: 'xs', value: RSSpacing.xs),
    const _SpacingItem(name: 'sm', value: RSSpacing.sm),
    const _SpacingItem(name: 'md', value: RSSpacing.md),
    const _SpacingItem(name: 'lg', value: RSSpacing.lg),
    const _SpacingItem(name: 'xl', value: RSSpacing.xl),
    const _SpacingItem(name: 'xxl', value: RSSpacing.xxl),
  ];

  return Scaffold(
    backgroundColor: RSColors.background,
    body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Espaciado (Spacing)', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 8),
          const Text('Sistema de medidas para paddings, margins y separaciones.', style: TextStyle(fontSize: 14, color: Colors.black54)),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.separated(
              itemCount: spacings.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final item = spacings[index];
                return Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('RSSpacing.${item.name}', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'monospace')),
                          Text('${item.value.toInt()}px', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Row(
                      children: [
                        Container(width: 40, height: 40, decoration: BoxDecoration(color: RSColors.surfaceContainerLow, borderRadius: BorderRadius.circular(4))),
                        Container(width: item.value, height: 20, color: RSColors.primary.withValues(alpha: 0.5), alignment: Alignment.center),
                        Container(width: 40, height: 40, decoration: BoxDecoration(color: RSColors.surfaceContainerLow, borderRadius: BorderRadius.circular(4))),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

class _SpacingItem {
  final String name;
  final double value;
  const _SpacingItem({required this.name, required this.value});
}