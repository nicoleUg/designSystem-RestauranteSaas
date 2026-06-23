import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Campo de texto personalizado y reutilizable del Design System de RestauranteSaas.
/// 
/// Implementa la estética de campo relleno ("Filled"):
/// * Fondo gris claro constante (`Color(0xFFF2F2F2)`).
/// * Sin bordes laterales ni superiores.
/// * Esquinas superiores redondeadas con un radio de 8px (`BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))`).
/// * Línea indicadora inferior activa que se ilumina con [RSColors.primary] cuando el campo está enfocado.
/// * Soporte nativo para iconos de prefijo (prefix) y sufijo (suffix), placeholders, etiquetas flotantes y validaciones.
class RSTextField extends StatelessWidget {
  /// Controlador opcional para rastrear y manipular el valor del campo.
  final TextEditingController? controller;

  /// Etiqueta descriptiva superior que flota cuando el campo tiene foco o texto.
  final String? labelText;

  /// Texto indicativo (placeholder) que se muestra cuando el campo está vacío.
  final String? hintText;

  /// Icono opcional que se muestra al principio del campo.
  final Widget? prefixIcon;

  /// Icono opcional que se muestra al final del campo (p. ej. botón de visibilidad de contraseña).
  final Widget? suffixIcon;

  /// Oculta el texto ingresado. Útil para contraseñas.
  final bool obscureText;

  /// Tipo de teclado adecuado para el campo (p. ej., email, números, texto).
  final TextInputType keyboardType;

  /// Función callback opcional para validar la entrada de texto en formularios.
  final FormFieldValidator<String>? validator;

  /// Callback opcional que se dispara cada vez que el texto cambia.
  final ValueChanged<String>? onChanged;

  /// Callback opcional que se dispara cuando el usuario presiona "Enviar" o "Listo" en el teclado.
  final ValueChanged<String>? onFieldSubmitted;

  /// Número máximo de líneas. Por defecto es 1.
  final int maxLines;

  /// Número mínimo de líneas. Por defecto es 1.
  final int? minLines;

  /// Determina si el campo está habilitado para la interacción. Por defecto es verdadero.
  final bool enabled;

  /// Acción del teclado al presionar enviar (p. ej., siguiente, hecho, buscar).
  final TextInputAction? textInputAction;

  /// Foco del campo de texto.
  final FocusNode? focusNode;

  const RSTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.textInputAction,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    // Configuración del radio de las esquinas superiores de 8px
    const BorderRadius topCornersRadius = BorderRadius.only(
      topLeft: Radius.circular(8.0),
      topRight: Radius.circular(8.0),
    );

    // Estilos de texto
    final TextStyle inputTextStyle = RSTypography.bodyLarge.copyWith(
      color: enabled ? Colors.black87 : Colors.black38,
    );

    final TextStyle labelTextStyle = RSTypography.bodyMedium.copyWith(
      color: enabled ? RSColors.textOnSurfaceVariant : Colors.black26,
    );

    final TextStyle hintTextStyle = RSTypography.bodyMedium.copyWith(
      color: Colors.black38,
    );

    final TextStyle errorTextStyle = RSTypography.bodySmall.copyWith(
      color: RSColors.error,
    );

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      textInputAction: textInputAction,
      style: inputTextStyle,
      cursorColor: RSColors.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        labelText: labelText,
        labelStyle: labelTextStyle,
        hintText: hintText,
        hintStyle: hintTextStyle,
        errorStyle: errorTextStyle,
        // Icono de prefijo (soporta cualquier Widget, típicamente un Icon)
        prefixIcon: prefixIcon != null
            ? IconTheme(
                data: IconThemeData(
                  color: enabled ? RSColors.textOnSurfaceVariant : Colors.black26,
                  size: 20.0,
                ),
                child: prefixIcon!,
              )
            : null,
        // Icono de sufijo
        suffixIcon: suffixIcon != null
            ? IconTheme(
                data: IconThemeData(
                  color: enabled ? RSColors.textOnSurfaceVariant : Colors.black26,
                  size: 20.0,
                ),
                child: suffixIcon!,
              )
            : null,
        // Alineación vertical interna y paddings estándar
        contentPadding: const EdgeInsets.symmetric(
          horizontal: RSSpacing.md,
          vertical: RSSpacing.sm,
        ),
        // Bordes: Sin bordes laterales ni superiores, con indicador inferior activo
        border: const UnderlineInputBorder(
          borderRadius: topCornersRadius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderRadius: topCornersRadius,
          borderSide: BorderSide(
            color: Colors.transparent, // Sin línea en reposo para un diseño minimalista
            width: 1.0,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderRadius: topCornersRadius,
          borderSide: BorderSide(
            color: RSColors.primary, // Línea inferior primaria activa
            width: 2.0,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderRadius: topCornersRadius,
          borderSide: BorderSide(
            color: RSColors.error,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderRadius: topCornersRadius,
          borderSide: BorderSide(
            color: RSColors.error,
            width: 2.0,
          ),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderRadius: topCornersRadius,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
