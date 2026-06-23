// lib/usecases/typography_usecases.dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../src/tokens/tokens.dart';

@widgetbook.UseCase(name: 'Estilos de Texto', type: RSTypography)
Widget buildTypographyUseCase(BuildContext context) {
  // Lista de estilos basados en tus tokens
  final List<_TypographyItem> styles = [
    _TypographyItem(name: 'headlineLarge', style: RSTypography.headlineLarge ?? const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
    _TypographyItem(name: 'headlineMedium', style: RSTypography.headlineMedium ?? const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
    _TypographyItem(name: 'headlineSmall', style: RSTypography.headlineSmall ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    _TypographyItem(name: 'titleLarge', style: RSTypography.titleLarge ?? const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
    _TypographyItem(name: 'titleMedium', style: RSTypography.titleMedium ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    _TypographyItem(name: 'titleSmall', style: RSTypography.titleSmall ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    _TypographyItem(name: 'bodyLarge', style: RSTypography.bodyLarge ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
    _TypographyItem(name: 'bodyMedium', style: RSTypography.bodyMedium ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
    _TypographyItem(name: 'bodySmall', style: RSTypography.bodySmall ?? const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
    _TypographyItem(name: 'labelLarge', style: RSTypography.labelLarge ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    _TypographyItem(name: 'labelMedium', style: RSTypography.labelMedium ?? const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
    _TypographyItem(name: 'labelSmall', style: RSTypography.labelSmall ?? const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
  ];

  return Scaffold(
    backgroundColor: RSColors.background,
    body: Padding(
      padding: const EdgeInsets.all(RSSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tipografía - RestauranteSaas', style: RSTypography.headlineMedium?.copyWith(color: Colors.black87) ?? const TextStyle(fontSize: 28)),
          const SizedBox(height: 8), // Usamos SizedBox nativo si no hay RSSpacing.verticalSm aquí
          Text('Escala tipográfica oficial del sistema.', style: RSTypography.bodyMedium?.copyWith(color: Colors.black54) ?? const TextStyle(fontSize: 14)),
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
                      // Información técnica del token
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
                      // Vista previa del texto
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