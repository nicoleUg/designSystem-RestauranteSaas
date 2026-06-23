// lib/usecases/spacing_usecases.dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../src/tokens/tokens.dart';

@widgetbook.UseCase(name: 'Escala de Espaciado', type: RSSpacing)
Widget buildSpacingUseCase(BuildContext context) {
  // Lista de tus tokens de espaciado (asumiendo los valores estándar)
  final List<_SpacingItem> spacings = [
    const _SpacingItem(name: 'xs', value: RSSpacing.xs ?? 4.0),
    const _SpacingItem(name: 'sm', value: RSSpacing.sm ?? 8.0),
    const _SpacingItem(name: 'md', value: RSSpacing.md ?? 16.0),
    const _SpacingItem(name: 'lg', value: RSSpacing.lg ?? 24.0),
    const _SpacingItem(name: 'xl', value: RSSpacing.xl ?? 32.0),
    const _SpacingItem(name: 'xxl', value: RSSpacing.xxl ?? 48.0),
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
                    // Información del token
                    SizedBox(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RSSpacing.${item.name}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'monospace'),
                          ),
                          Text(
                            '${item.value.toInt()}px',
                            style: const TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Representación visual del espaciado
                    Row(
                      children: [
                        Container(width: 40, height: 40, decoration: BoxDecoration(color: RSColors.surfaceContainerLow, borderRadius: BorderRadius.circular(4))),
                        // Aquí visualizamos el espaciado en color primario
                        Container(
                          width: item.value,
                          height: 20,
                          color: RSColors.primary.withOpacity(0.5),
                          alignment: Alignment.center,
                        ),
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