import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Define las variantes visuales soportadas por el botón oficial [RSButton].
enum RSButtonVariant {
  /// Fondo primario y texto blanco.
  filled,

  /// Fondo primario con opacidad del 10% y texto primario.
  tonal,

  /// Borde outlineVariant y texto primario.
  outlined,
}

/// Define los tamaños soportados para el botón [RSButton].
enum RSButtonSize {
  /// Altura de 36px, espaciado compacto. Ideal para interfaces densas.
  small,

  /// Altura de 48px, estándar de la industria. Ideal para la mayoría de los formularios.
  medium,

  /// Altura de 56px, grande e interactivo. Ideal para llamadas a la acción (CTAs) críticas.
  large,
}

/// Define la posición del icono dentro del botón [RSButton].
enum RSIconPosition {
  /// El icono se renderiza antes del texto de la etiqueta.
  leading,

  /// El icono se renderiza después del texto de la etiqueta.
  trailing,
}

/// Widget de botón personalizado y reutilizable del Design System de RestauranteSaas.
/// 
/// Cumple con la especificación de Material 3 y ofrece tres variantes principales:
/// [RSButtonVariant.filled], [RSButtonVariant.tonal], y [RSButtonVariant.outlined].
/// Cuenta con bordes completamente redondeados (Pill-shaped), soporte para iconos y 
/// un estado de carga integrado de alta fidelidad.
class RSButton extends StatelessWidget {
  /// Etiqueta de texto que se muestra en el botón.
  final String label;

  /// Callback que se ejecuta al presionar el botón. Si es nulo, el botón se deshabilita automáticamente.
  final VoidCallback? onPressed;

  /// Variante visual del botón.
  final RSButtonVariant variant;

  /// Tamaño y altura del botón.
  final RSButtonSize size;

  /// Icono opcional que se muestra junto con la etiqueta de texto.
  final Widget? icon;

  /// Determina si el icono va antes o después del texto. Por defecto es [RSIconPosition.leading].
  final RSIconPosition iconPosition;

  /// Indica si el botón se encuentra en un estado de carga.
  /// Si es verdadero, muestra un indicador de progreso circular en lugar del contenido y deshabilita la interacción.
  final bool isLoading;

  /// Ancho completo (ocupa todo el espacio horizontal disponible). Por defecto es falso.
  final bool fullWidth;

  const RSButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = RSButtonVariant.filled,
    this.size = RSButtonSize.medium,
    this.icon,
    this.iconPosition = RSIconPosition.leading,
    this.isLoading = false,
    this.fullWidth = false,
  });

  /// Constructor de fábrica para el botón **Filled** (Relleno).
  ///
  /// Utiliza un fondo primario con texto blanco de alta visibilidad.
  factory RSButton.filled({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    RSButtonSize size = RSButtonSize.medium,
    Widget? icon,
    RSIconPosition iconPosition = RSIconPosition.leading,
    bool isLoading = false,
    bool fullWidth = false,
  }) {
    return RSButton(
      key: key,
      label: label,
      onPressed: onPressed,
      variant: RSButtonVariant.filled,
      size: size,
      icon: icon,
      iconPosition: iconPosition,
      isLoading: isLoading,
      fullWidth: fullWidth,
    );
  }

  /// Constructor de fábrica para el botón **Tonal** (Tonal).
  ///
  /// Utiliza un fondo primario suave con 10% de opacidad y texto del color primario.
  factory RSButton.tonal({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    RSButtonSize size = RSButtonSize.medium,
    Widget? icon,
    RSIconPosition iconPosition = RSIconPosition.leading,
    bool isLoading = false,
    bool fullWidth = false,
  }) {
    return RSButton(
      key: key,
      label: label,
      onPressed: onPressed,
      variant: RSButtonVariant.tonal,
      size: size,
      icon: icon,
      iconPosition: iconPosition,
      isLoading: isLoading,
      fullWidth: fullWidth,
    );
  }

  /// Constructor de fábrica para el botón **Outlined** (Delineado).
  ///
  /// Utiliza un contorno sutil con [RSColors.outlineVariant] y texto del color primario.
  factory RSButton.outlined({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    RSButtonSize size = RSButtonSize.medium,
    Widget? icon,
    RSIconPosition iconPosition = RSIconPosition.leading,
    bool isLoading = false,
    bool fullWidth = false,
  }) {
    return RSButton(
      key: key,
      label: label,
      onPressed: onPressed,
      variant: RSButtonVariant.outlined,
      size: size,
      icon: icon,
      iconPosition: iconPosition,
      isLoading: isLoading,
      fullWidth: fullWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;

    // Determinar colores basados en la variante
    final Color backgroundColor = _getBackgroundColor(isEnabled);
    final Color foregroundColor = _getForegroundColor(isEnabled);
    final BorderSide? border = _getBorderSide(isEnabled);

    // Configurar el estilo del texto de la etiqueta
    final TextStyle textStyle = RSTypography.labelLarge.copyWith(
      color: foregroundColor,
    );

    // Dimensiones basadas en el tamaño configurado
    final double height = _getHeight();
    final double horizontalPadding = _getHorizontalPadding();

    // Contenido del botón
    Widget buttonContent;
    if (isLoading) {
      buttonContent = SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
        ),
      );
    } else {
      final List<Widget> children = [];

      // Añadir icono si es leading
      if (icon != null && iconPosition == RSIconPosition.leading) {
        children.add(
          Theme(
            data: ThemeData(
              iconTheme: IconThemeData(
                color: foregroundColor,
                size: size == RSButtonSize.small ? 16 : 18,
              ),
            ),
            child: icon!,
          ),
        );
        children.add(RSSpacing.horizontalSm);
      }

      // Añadir etiqueta de texto
      children.add(
        Text(
          label,
          style: textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

      // Añadir icono si es trailing
      if (icon != null && iconPosition == RSIconPosition.trailing) {
        children.add(RSSpacing.horizontalSm);
        children.add(
          Theme(
            data: ThemeData(
              iconTheme: IconThemeData(
                color: foregroundColor,
                size: size == RSButtonSize.small ? 16 : 18,
              ),
            ),
            child: icon!,
          ),
        );
      }

      buttonContent = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }

    // Material Button con animaciones y micro-interacciones incorporadas
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9999), // Pill-shaped
      side: border ?? BorderSide.none,
    );

    Widget resultButton = SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return variant == RSButtonVariant.outlined
                    ? Colors.transparent
                    : Colors.black.withValues(alpha: 0.06);
              }
              if (states.contains(WidgetState.hovered)) {
                return backgroundColor.withValues(alpha: 
                  variant == RSButtonVariant.outlined ? 0.04 : 0.90,
                );
              }
              if (states.contains(WidgetState.pressed)) {
                return backgroundColor.withValues(alpha: 
                  variant == RSButtonVariant.outlined ? 0.08 : 0.80,
                );
              }
              return backgroundColor;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.black38;
              }
              return foregroundColor;
            },
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: horizontalPadding),
          ),
          shape: WidgetStateProperty.all<OutlinedBorder>(buttonShape),
          side: WidgetStateProperty.resolveWith<BorderSide>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return variant == RSButtonVariant.outlined
                    ? const BorderSide(color: Colors.black12, width: 1.0)
                    : BorderSide.none;
              }
              return border ?? BorderSide.none;
            },
          ),
          elevation: WidgetStateProperty.resolveWith<double>(
            (states) {
              if (states.contains(WidgetState.pressed)) return 0.0;
              if (states.contains(WidgetState.hovered) && variant == RSButtonVariant.filled) {
                return 1.5; // Micro-elevación al hacer hover para diseño premium
              }
              return 0.0;
            },
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.hovered)) {
                return foregroundColor.withValues(alpha: 0.08);
              }
              if (states.contains(WidgetState.pressed)) {
                return foregroundColor.withValues(alpha: 0.12);
              }
              return null;
            },
          ),
        ),
        child: buttonContent,
      ),
    );

    if (fullWidth) {
      return SizedBox(
        width: double.infinity,
        child: resultButton,
      );
    }

    return resultButton;
  }

  // Métodos auxiliares privados para estilos y dimensiones

  Color _getBackgroundColor(bool isEnabled) {
    if (!isEnabled) {
      return variant == RSButtonVariant.outlined ? Colors.transparent : Colors.black.withValues(alpha: 0.06);
    }
    switch (variant) {
      case RSButtonVariant.filled:
        return RSColors.primary;
      case RSButtonVariant.tonal:
        return RSColors.primary.withValues(alpha: 0.10);
      case RSButtonVariant.outlined:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor(bool isEnabled) {
    if (!isEnabled) {
      return Colors.black26;
    }
    switch (variant) {
      case RSButtonVariant.filled:
        return Colors.white;
      case RSButtonVariant.tonal:
      case RSButtonVariant.outlined:
        return RSColors.primary;
    }
  }

  BorderSide? _getBorderSide(bool isEnabled) {
    if (variant == RSButtonVariant.outlined) {
      return BorderSide(
        color: isEnabled ? RSColors.outlineVariant : Colors.black12,
        width: 1.0,
      );
    }
    return null;
  }

  double _getHeight() {
    switch (size) {
      case RSButtonSize.small:
        return 36.0;
      case RSButtonSize.medium:
        return 48.0;
      case RSButtonSize.large:
        return 56.0;
    }
  }

  double _getHorizontalPadding() {
    switch (size) {
      case RSButtonSize.small:
        return RSSpacing.md;
      case RSButtonSize.medium:
        return RSSpacing.lg;
      case RSButtonSize.large:
        return RSSpacing.xl;
    }
  }
}
