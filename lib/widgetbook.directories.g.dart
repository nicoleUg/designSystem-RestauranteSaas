// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:restaurantesaas_design_system/usecases/button_usecases.dart'
    as _restaurantesaas_design_system_usecases_button_usecases;
import 'package:restaurantesaas_design_system/usecases/card_usecases.dart'
    as _restaurantesaas_design_system_usecases_card_usecases;
import 'package:restaurantesaas_design_system/usecases/chip_usecases.dart'
    as _restaurantesaas_design_system_usecases_chip_usecases;
import 'package:restaurantesaas_design_system/usecases/input_usecases.dart'
    as _restaurantesaas_design_system_usecases_input_usecases;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'RSButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Filled (Primario)',
            builder: _restaurantesaas_design_system_usecases_button_usecases
                .buildFilledButtonUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Loading State',
            builder: _restaurantesaas_design_system_usecases_button_usecases
                .buildLoadingButtonUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Outlined',
            builder: _restaurantesaas_design_system_usecases_button_usecases
                .buildOutlinedButtonUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'RSCard',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Con Imagen Header',
            builder: _restaurantesaas_design_system_usecases_card_usecases
                .buildHeaderCardUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Interactiva (Hover/Tap)',
            builder: _restaurantesaas_design_system_usecases_card_usecases
                .buildInteractiveCardUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Tarjeta Básica',
            builder: _restaurantesaas_design_system_usecases_card_usecases
                .buildBasicCardUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'RSChoiceChip',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Inactivo / No seleccionado',
            builder: _restaurantesaas_design_system_usecases_chip_usecases
                .buildUnselectedChipUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Seleccionado',
            builder: _restaurantesaas_design_system_usecases_chip_usecases
                .buildSelectedChipUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'RSTextField',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Contraseña con Iconos',
            builder: _restaurantesaas_design_system_usecases_input_usecases
                .buildPasswordInputUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Texto Estándar',
            builder: _restaurantesaas_design_system_usecases_input_usecases
                .buildStandardInputUseCase,
          ),
        ],
      ),
    ],
  )
];
