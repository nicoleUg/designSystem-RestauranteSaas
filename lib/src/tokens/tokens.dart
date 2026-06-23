import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Clase estática que contiene los tokens de color oficiales para RestauranteSaas.
/// 
/// Diseñados en base al sistema de colores de Material 3 para proporcionar 
/// una estética premium, moderna y consistente.
abstract class RSColors {
  /// Color primario principal (Tono óxido/cálido característico del SaaS culinario)
  static const Color primary = Color(0xFFB02F00);

  /// Contenedor de color primario para destacar elementos importantes
  static const Color primaryContainer = Color(0xFFFF5722);

  /// Color de fondo general de la aplicación
  static const Color background = Color(0xFFF8F9FA);

  /// Color de superficie por defecto
  static const Color surface = Color(0xFFF8F9FA);

  /// Superficie con baja elevación visual (p. ej., tarjetas secundarias, contenedores)
  static const Color surfaceContainerLow = Color(0xFFF3F4F5);

  /// Superficie con la mínima elevación visual o blanca pura (p. ej., tarjetas, diálogos)
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);

  /// Variante de contorno (bordes sutiles, divisores y líneas de separación)
  static const Color outlineVariant = Color(0xFFE4BEB4);

  /// Color de texto sobre variantes de superficie (tonos terrosos oscuros)
  static const Color textOnSurfaceVariant = Color(0xFF5B4039);

  /// Color de error para estados críticos o de validación fallida
  static const Color error = Color(0xFFBA1A1A);

  /// Genera el [ColorScheme] oficial a partir de los tokens de color de RestauranteSaas.
  static ColorScheme get colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      primaryContainer: primaryContainer,
      onPrimaryContainer: Colors.white,
      secondary: primaryContainer,
      onSecondary: Colors.white,
      surface: surface,
      onSurface: Color(0xFF1C1B1B),
      surfaceContainerHighest: surfaceContainerLow,
      onSurfaceVariant: textOnSurfaceVariant,
      outlineVariant: outlineVariant,
      error: error,
      onError: Colors.white,
    );
  }
}

/// Token de tipografía que define los estilos de texto utilizando la fuente Google Fonts (Inter).
/// 
/// Sigue la especificación de Material 3 para títulos, subtítulos, etiquetas y cuerpo.
abstract class RSTypography {
  /// Fuente base utilizada en todo el sistema de diseño
  static final TextStyle _baseStyle = GoogleFonts.inter();

  /// Título grande para pantallas principales y secciones destacadas (M3 Display Large)
  static TextStyle get displayLarge => _baseStyle.copyWith(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        height: 1.12,
      );

  /// Título mediano para banners principales (M3 Display Medium)
  static TextStyle get displayMedium => _baseStyle.copyWith(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.16,
      );

  /// Título de sección más destacado (M3 Headline Large)
  static TextStyle get headlineLarge => _baseStyle.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 1.25,
      );

  /// Título de sección mediano (M3 Headline Medium)
  static TextStyle get headlineMedium => _baseStyle.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.29,
      );

  /// Título de sección pequeño (M3 Headline Small)
  static TextStyle get headlineSmall => _baseStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 1.33,
      );

  /// Estilo para títulos principales en barras superiores o tarjetas (M3 Title Large)
  static TextStyle get titleLarge => _baseStyle.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.27,
      );

  /// Estilo para subtítulos secundarios y encabezados de campo (M3 Title Medium)
  static TextStyle get titleMedium => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.5,
      );

  /// Estilo para títulos de nivel inferior o elementos de lista (M3 Title Small)
  static TextStyle get titleSmall => _baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
      );

  /// Cuerpo del texto principal con legibilidad excelente (M3 Body Large)
  static TextStyle get bodyLarge => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.5,
      );

  /// Cuerpo del texto secundario para detalles o descripciones largas (M3 Body Medium)
  static TextStyle get bodyMedium => _baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
      );

  /// Texto del cuerpo en formato micro o leyendas (M3 Body Small)
  static TextStyle get bodySmall => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.33,
      );

  /// Texto para botones y acciones interactivas primarias (M3 Label Large)
  static TextStyle get labelLarge => _baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
      );

  /// Texto de etiquetas secundarias o chips (M3 Label Medium)
  static TextStyle get labelMedium => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.33,
      );

  /// Texto para micro-anotaciones o badges (M3 Label Small)
  static TextStyle get labelSmall => _baseStyle.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.45,
      );

  /// Genera un [TextTheme] completo para integrarse directamente en el tema de Flutter.
  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }
}

/// Sistema de espaciado unificado para márgenes, paddings y tamaños de contenedores.
abstract class RSSpacing {
  /// Espaciado extra pequeño de 4px
  static const double xs = 4.0;

  /// Espaciado pequeño de 8px
  static const double sm = 8.0;

  /// Espaciado mediano estándar de 16px
  static const double md = 16.0;

  /// Espaciado grande de 24px
  static const double lg = 24.0;

  /// Espaciado extra grande de 32px
  static const double xl = 32.0;

  /// Espaciado gigante de 48px
  static const double xxl = 48.0;

  /// Margen horizontal estándar recomendado para vistas de pantallas
  static const double screenMargin = 16.0;

  /// Espaciador vertical predefinido de tamaño extra pequeño (4px)
  static const SizedBox verticalXs = SizedBox(height: xs);

  /// Espaciador vertical predefinido de tamaño pequeño (8px)
  static const SizedBox verticalSm = SizedBox(height: sm);

  /// Espaciador vertical predefinido de tamaño mediano (16px)
  static const SizedBox verticalMd = SizedBox(height: md);

  /// Espaciador vertical predefinido de tamaño grande (24px)
  static const SizedBox verticalLg = SizedBox(height: lg);

  /// Espaciador vertical predefinido de tamaño extra grande (32px)
  static const SizedBox verticalXl = SizedBox(height: xl);

  /// Espaciador horizontal predefinido de tamaño extra pequeño (4px)
  static const SizedBox horizontalXs = SizedBox(width: xs);

  /// Espaciador horizontal predefinido de tamaño pequeño (8px)
  static const SizedBox horizontalSm = SizedBox(width: sm);

  /// Espaciador horizontal predefinido de tamaño mediano (16px)
  static const SizedBox horizontalMd = SizedBox(width: md);

  /// Espaciador horizontal predefinido de tamaño grande (24px)
  static const SizedBox horizontalLg = SizedBox(width: lg);
}
