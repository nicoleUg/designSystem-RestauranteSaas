import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Un contenedor tipo tarjeta altamente personalizado del Design System de RestauranteSaas.
/// 
/// Diseñado con esquinas redondeadas de 16px, fondo blanco puro [RSColors.surfaceContainerLowest],
/// un borde sutil de 1px en [RSColors.outlineVariant] y una elevación mínima personalizable.
/// 
/// Proporciona soporte nativo para:
/// * Encabezado de imágenes o banners con esquinas superiores perfectamente recortadas a 16px.
/// * Interacciones táctiles nativas (efecto InkWell de Material) si se provee el callback [onTap].
/// * Gestión automática de desbordamiento de bordes mediante `Clip.antiAlias`.
class RSCard extends StatelessWidget {
  /// El widget de contenido principal que se mostrará dentro de la tarjeta.
  final Widget child;

  /// Widget de imagen o banner opcional que se colocará en la parte superior de la tarjeta.
  /// Si se provee, sus esquinas superiores se recortarán a 16px para encajar perfectamente con la tarjeta.
  final Widget? headerImage;

  /// Altura reservada para el [headerImage]. Por defecto es 160.0.
  final double headerHeight;

  /// Callback que se activa al pulsar la tarjeta. Si se provee, la tarjeta se vuelve interactiva.
  final VoidCallback? onTap;

  /// El espaciado interno del contenido principal de la tarjeta. Por defecto es [RSSpacing.md] (16px).
  final EdgeInsetsGeometry padding;

  /// Color de fondo de la tarjeta. Por defecto es [RSColors.surfaceContainerLowest] (Blanco).
  final Color backgroundColor;

  /// Color del contorno/borde. Por defecto es [RSColors.outlineVariant].
  final Color borderColor;

  /// Grosor del contorno/borde de la tarjeta. Por defecto es 1.0.
  final double borderWidth;

  /// Elevación o sombra proyectada por la tarjeta. Por defecto es 0.0 para un estilo plano Material 3 limpio,
  /// pero se puede aumentar para dar profundidad.
  final double elevation;

  /// Sombra personalizada para un acabado aún más premium. Si se provee, anula la elevación estándar de Flutter.
  final List<BoxShadow>? customShadows;

  const RSCard({
    super.key,
    required this.child,
    this.headerImage,
    this.headerHeight = 160.0,
    this.onTap,
    this.padding = const EdgeInsets.all(RSSpacing.md),
    this.backgroundColor = RSColors.surfaceContainerLowest,
    this.borderColor = RSColors.outlineVariant,
    this.borderWidth = 1.0,
    this.elevation = 0.0,
    this.customShadows,
  });

  @override
  Widget build(BuildContext context) {
    // Si no se proveen sombras personalizadas pero se requiere una sombra sutil premium, 
    // podemos aplicar una sombra muy suave cuando la elevación sea mayor a 0
    final List<BoxShadow> shadows = customShadows ??
        (elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: elevation * 4,
                  offset: Offset(0, elevation),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: elevation * 2,
                  offset: Offset(0, elevation / 2),
                ),
              ]
            : []);

    // El contenedor principal con bordes y formas
    Widget cardDecoration = Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        boxShadow: shadows,
      ),
      // Recorta cualquier widget secundario que desborde las esquinas de 16px (como el headerImage)
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Imagen o header superior
          if (headerImage != null)
            SizedBox(
              height: headerHeight,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0), // 1px menos para evitar artefactos visuales con el borde
                  topRight: Radius.circular(15.0),
                ),
                child: headerImage!,
              ),
            ),
          
          // Contenido principal de la tarjeta con el padding configurado
          Padding(
            padding: padding,
            child: child,
          ),
        ],
      ),
    );

    // Si es interactivo, Envolvemos el contenido en un InkWell para el efecto visual de pulsación
    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.0),
          splashColor: RSColors.primary.withValues(alpha: 0.04),
          highlightColor: RSColors.primary.withValues(alpha: 0.02),
          child: cardDecoration,
        ),
      );
    }

    return cardDecoration;
  }
}
