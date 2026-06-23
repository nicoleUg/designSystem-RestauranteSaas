import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../tokens/tokens.dart'; 

class Tipografia extends StatelessWidget {
  const Tipografia({super.key});
  @override Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Estilos de Texto', type: Tipografia)
Widget buildTypographyUseCase(BuildContext context) {
  final List<_TypographyItem> styles = [
    _TypographyItem(name: 'headlineLarge', style: RSTypography.headlineLarge),
    _TypographyItem(name: 'headlineMedium', style: RSTypography.headlineMedium),
    _TypographyItem(name: 'headlineSmall', style: RSTypography.headlineSmall),
    _TypographyItem(name: 'titleLarge', style: RSTypography.titleLarge),
    _TypographyItem(name: 'titleMedium', style: RSTypography.titleMedium),
    _TypographyItem(name: 'titleSmall', style: RSTypography.titleSmall),
    _TypographyItem(name: 'bodyLarge', style: RSTypography.bodyLarge),
    _TypographyItem(name: 'bodyMedium', style: RSTypography.bodyMedium),
    _TypographyItem(name: 'bodySmall', style: RSTypography.bodySmall),
    _TypographyItem(name: 'labelLarge', style: RSTypography.labelLarge),
    _TypographyItem(name: 'labelMedium', style: RSTypography.labelMedium),
    _TypographyItem(name: 'labelSmall', style: RSTypography.labelSmall),
  ];

  return Scaffold(
    backgroundColor: RSColors.background,
    body: Padding(
      padding: const EdgeInsets.all(RSSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tipografía - RestauranteSaas', style: RSTypography.headlineMedium.copyWith(color: Colors.black87)),
          const SizedBox(height: 8), 
          Text('Escala tipográfica oficial del sistema.', style: RSTypography.bodyMedium.copyWith(color: Colors.black54)),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: styles.length,
              separatorBuilder: (context, index) => const Divider(color: RSColors.outlineVariant),
              itemBuilder: (context, index) {
                final item = styles[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(fontWeight: FontWeight.bold, color: RSColors.primary, fontFamily: 'monospace'),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Size: ${item.style.fontSize?.toInt()} | W: ${item.style.fontWeight?.value}',
                              style: const TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Text(
                          'El rápido zorro marrón salta sobre el perro perezoso.',
                          style: item.style.copyWith(color: Colors.black87),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

class _TypographyItem {
  final String name;
  final TextStyle style;
  _TypographyItem({required this.name, required this.style});
}