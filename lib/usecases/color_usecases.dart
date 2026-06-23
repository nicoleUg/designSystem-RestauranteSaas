// lib/usecases/color_usecases.dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../src/tokens/tokens.dart';

@widgetbook.UseCase(name: 'Paleta de Colores', type: RSColors)
Widget buildColorPaletteUseCase(BuildContext context) {
  final List<_ColorItem> tokens = [
    const _ColorItem(
      name: 'primary',
      color: RSColors.primary,
      description: 'Color primario principal. Tono óxido/cálido característico de la marca.',
    ),
    const _ColorItem(
      name: 'primaryContainer',
      color: RSColors.primaryContainer,
      description: 'Contenedor de color primario para destacar elementos importantes.',
    ),
    const _ColorItem(
      name: 'background',
      color: RSColors.background,
      description: 'Color de fondo general de la aplicación.',
    ),
    const _ColorItem(
      name: 'surface',
      color: RSColors.surface,
      description: 'Color de superficie por defecto para contenedores base.',
    ),
    const _ColorItem(
      name: 'surfaceContainerLow',
      color: RSColors.surfaceContainerLow,
      description: 'Superficie con baja elevación visual (tarjetas secundarias, contenedores).',
    ),
    const _ColorItem(
      name: 'surfaceContainerLowest',
      color: RSColors.surfaceContainerLowest,
      description: 'Mínima elevación visual o blanca pura (tarjetas principales, diálogos).',
    ),
    const _ColorItem(
      name: 'outlineVariant',
      color: RSColors.outlineVariant,
      description: 'Variante de contorno para bordes sutiles, divisores y líneas.',
    ),
    const _ColorItem(
      name: 'textOnSurfaceVariant',
      color: RSColors.textOnSurfaceVariant,
      description: 'Color de texto sobre variantes de superficie (tonos terrosos oscuros).',
    ),
    const _ColorItem(
      name: 'error',
      color: RSColors.error,
      description: 'Color de error para estados críticos o validaciones fallidas.',
    ),
  ];

  return Scaffold(
    backgroundColor: RSColors.background,
    body: Padding(
      padding: const EdgeInsets.all(RSSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tokens de Color - RestauranteSaas',
            style: RSTypography.headlineMedium.copyWith(color: Colors.black87),
          ),
          RSSpacing.verticalSm,
          Text(
            'Guía visual de los colores oficiales definidos en el sistema de diseño.',
            style: RSTypography.bodyMedium.copyWith(color: Colors.black54),
          ),
          RSSpacing.verticalLg,
          Expanded(
            child: ListView.separated(
              itemCount: tokens.length,
              separatorBuilder: (context, index) => RSSpacing.verticalSm,
              itemBuilder: (context, index) {
                final item = tokens[index];
                // Convertir el valor numérico del color a un String Hexadecimal limpio (ej: #B02F00)
                final hexCode = '#${item.color.value.toRadixString(16).substring(2).toUpperCase()}';

                return Container(
                  decoration: BoxDecoration(
                    color: RSColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: RSColors.outlineVariant,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(RSSpacing.md),
                    child: Row(
                      children: [
                        // Muestra visual del color
                        Container(
                          width: 56.0,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: item.color,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        RSSpacing.horizontalMd,
                        // Información del token
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'RSColors.${item.name}',
                                style: RSTypography.titleSmall.copyWith(
                                  color: Colors.black87,
                                  fontFamily: 'monospace',
                                ),
                              ),
                              RSSpacing.verticalXs,
                              Text(
                                item.description,
                                style: RSTypography.bodySmall.copyWith(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RSSpacing.horizontalMd,
                        // Código HEX
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 6.0,
                          ),
                          decoration: BoxDecoration(
                            color: RSColors.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            hexCode,
                            style: RSTypography.labelSmall.copyWith(
                              color: RSColors.textOnSurfaceVariant,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ],
                    ),
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

class _ColorItem {
  final String name;
  final Color color;
  final String description;

  const _ColorItem({
    required this.name,
    required this.color,
    required this.description,
  });
}