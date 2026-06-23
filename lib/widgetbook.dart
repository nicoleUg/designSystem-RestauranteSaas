// lib/widgetbook.dart
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Importar los tokens de tu sistema de diseño (opcional, para el tema)
import 'src/tokens/tokens.dart'; 

// Este archivo será generado automáticamente en el Paso 4
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // 'directories' se genera automáticamente
      directories: directories,
      addons: [
        // Addon para cambiar entre modos oscuro/claro o temas de tu marca
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'RestauranteSaas Light',
              data: ThemeData(colorScheme: RSColors.colorScheme),
            ),
          ],
        ),
        // Addon para probar en distintos tamaños de pantalla
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.ios.iPad,
            Devices.android.samsungGalaxyS20,
          ],
        ),
      ],
    );
  }
}