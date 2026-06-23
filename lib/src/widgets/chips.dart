import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Un chip interactivo y animado del Design System de RestauranteSaas.
/// 
/// Diseñado bajo la especificación de Material 3 con las siguientes características:
/// * Esquinas redondeadas fijas (`BorderRadius.circular(12)`).
/// * Fondo persistente en [RSColors.surfaceContainerLow] tanto para el estado seleccionado como no seleccionado.
/// * Borde dinámico: [RSColors.primary] cuando está seleccionado y [RSColors.outlineVariant] cuando no.
/// * Soporte para iconos opcionales a la izquierda (leading).
/// * Micro-animaciones en los cambios de estado (borde, colores e iconos).
class RSChoiceChip extends StatelessWidget {
  /// El texto principal que describe el chip.
  final String label;

  /// Indica si el chip se encuentra actualmente seleccionado.
  final bool selected;

  /// Callback invocado cuando el usuario pulsa sobre el chip.
  /// Retorna el nuevo estado booleano de selección.
  final ValueChanged<bool>? onSelected;

  /// Icono opcional que se renderiza a la izquierda de la etiqueta.
  final Widget? icon;

  /// Habilita o deshabilita la interacción con el chip. Por defecto es verdadero.
  final bool isEnabled;

  /// Espaciado interno personalizado del chip. Por defecto es 12px horizontal y 8px vertical.
  final EdgeInsetsGeometry padding;

  const RSChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.icon,
    this.isEnabled = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: RSSpacing.md,
      vertical: RSSpacing.sm,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final bool isClickable = isEnabled && onSelected != null;

    // Colores basados en el estado de selección
    final Color backgroundColor = RSColors.surfaceContainerLow;
    final Color borderColor = selected 
        ? RSColors.primary 
        : (isClickable ? RSColors.outlineVariant : Colors.black12);
    final double borderWidth = selected ? 1.8 : 1.0;

    // Color del texto y del icono
    final Color contentColor = selected
        ? RSColors.primary
        : (isClickable ? RSColors.textOnSurfaceVariant : Colors.black38);

    // Estilo de texto interactivo
    final TextStyle textStyle = RSTypography.labelMedium.copyWith(
      color: contentColor,
      fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
    );

    // Contenido del chip
    Widget chipContent = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Theme(
            data: ThemeData(
              iconTheme: IconThemeData(
                color: contentColor,
                size: 16.0,
              ),
            ),
            child: icon!,
          ),
          RSSpacing.horizontalSm,
        ],
        Text(
          label,
          style: textStyle,
        ),
      ],
    );

    // Micro-animación en los cambios de estado (borde)
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: isClickable ? () => onSelected!(!selected) : null,
          mouseCursor: isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
          splashColor: RSColors.primary.withValues(alpha: 0.06),
          highlightColor: RSColors.primary.withValues(alpha: 0.03),
          child: Padding(
            padding: padding,
            child: chipContent,
          ),
        ),
      ),
    );
  }
}
