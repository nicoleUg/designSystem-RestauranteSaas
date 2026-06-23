import 'package:flutter/material.dart';
import '../tokens/tokens.dart';
import 'cards.dart';

/// Tarjeta de pedido arrastrable (Draggable) para tableros Kanban de RestauranteSaas.
/// 
/// Envuelve un contenido en un [RSCard] y lo gestiona a través de [LongPressDraggable] para evitar
/// conflictos con gestos de scroll normales en dispositivos móviles.
/// 
/// Características:
/// * **Feedback**: Renderiza una miniatura semitransparente (opacidad 70%) y ligeramente elevada
///   del pedido bajo el dedo del usuario durante el arrastre.
/// * **Placeholder**: Mientras se arrastra, el espacio original de la tarjeta se atenúa (opacidad 30%)
///   para guiar visualmente al usuario.
/// * **Material 3**: Utiliza la elevación, sombras y bordes curvos estándar de nuestro Design System.
class RSDraggableOrderCard extends StatelessWidget {
  /// Identificador único del pedido (se transmite al [DragTarget] en la columna destino).
  final String orderId;

  /// El widget de contenido que describe el pedido (p. ej., número de mesa, lista de productos, etc.).
  final Widget child;

  /// Callback opcional que se activa al pulsar la tarjeta de forma normal.
  final VoidCallback? onTap;

  const RSDraggableOrderCard({
    super.key,
    required this.orderId,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // La tarjeta base que representa el pedido
    final Widget cardWidget = RSCard(
      onTap: onTap,
      elevation: 1.0,
      padding: const EdgeInsets.all(RSSpacing.md),
      child: child,
    );

    return LongPressDraggable<String>(
      data: orderId,
      maxSimultaneousDrags: 1,
      // Retroalimentación visual flotante (Feedback)
      feedback: Material(
        color: Colors.transparent,
        child: Opacity(
          opacity: 0.75,
          child: Transform.rotate(
            angle: 0.04, // Ligera rotación premium (2.3 grados) para simular el arrastre libre
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75 > 320 
                  ? 320 
                  : MediaQuery.of(context).size.width * 0.75,
              child: RSCard(
                elevation: 6.0, // Más sombra para dar sensación de flotar
                borderColor: RSColors.primary,
                borderWidth: 1.5,
                child: child,
              ),
            ),
          ),
        ),
      ),
      // Widget que se queda en el Kanban mientras se arrastra (Placeholder)
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: cardWidget,
      ),
      child: cardWidget,
    );
  }
}

/// Columna receptora de pedidos (DragTarget) para tableros Kanban de administración.
/// 
/// Características:
/// * Recibe instancias de [RSDraggableOrderCard] mediante arrastre y soltado.
/// * Cambia dinámicamente su color de fondo a un tono tintado cuando un pedido se mantiene
///   sobre ella (Hover), ofreciendo retroalimentación visual inmediata.
/// * Dispara la función callback [onOrderDropped] al soltar exitosamente un pedido.
/// * Posee un encabezado elegante con soporte para colores de acento y contador de items.
class RSOrderKanbanColumn extends StatelessWidget {
  /// Título de la columna (p. ej., "Pendiente", "En Cocina", "Entregado").
  final String title;

  /// Lista de widgets de tarjeta (normalmente [RSDraggableOrderCard]) contenidos en esta columna.
  final List<Widget> children;

  /// Callback que se dispara cuando un pedido ([orderId]) se suelta sobre esta columna.
  final Function(String orderId) onOrderDropped;

  /// Color decorativo para la línea de acento del encabezado. Por defecto es [RSColors.outlineVariant].
  final Color? accentColor;

  /// Widget de fondo opcional cuando la columna está vacía (p. ej. una ilustración de "Sin pedidos").
  final Widget? emptyStatePlaceholder;

  const RSOrderKanbanColumn({
    super.key,
    required this.title,
    required this.children,
    required this.onOrderDropped,
    this.accentColor,
    this.emptyStatePlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeAccentColor = accentColor ?? RSColors.outlineVariant;

    return DragTarget<String>(
      onWillAcceptWithDetails: (details) => true,
      onAcceptWithDetails: (details) {
        onOrderDropped(details.data);
      },
      builder: (context, candidateData, rejectedData) {
        // Rastrear si hay un arrastre activo flotando sobre esta columna
        final bool isHovered = candidateData.isNotEmpty;

        // Color de fondo dinámico según hover
        final Color columnBgColor = isHovered
            ? RSColors.primary.withValues(alpha: 0.04) // Fondo tintado suave al pasar sobre la columna
            : RSColors.surfaceContainerLow;

        // Borde dinámico al pasar encima
        final Border columnBorder = Border.all(
          color: isHovered ? RSColors.primary.withValues(alpha: 0.3) : Colors.transparent,
          width: 1.5,
        );

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: columnBgColor,
            borderRadius: BorderRadius.circular(16.0),
            border: columnBorder,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Encabezado de la columna
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  RSSpacing.md,
                  RSSpacing.md,
                  RSSpacing.md,
                  RSSpacing.sm,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: RSTypography.titleMedium.copyWith(
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Contador de items circular interactivo
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: RSColors.surfaceContainerLowest,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: RSColors.outlineVariant,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            '${children.length}',
                            style: RSTypography.labelSmall.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    RSSpacing.verticalSm,
                    // Línea horizontal de acento de color
                    Container(
                      height: 3.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: activeAccentColor,
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    ),
                  ],
                ),
              ),

              // Lista vertical de pedidos
              Expanded(
                child: children.isEmpty
                    ? (emptyStatePlaceholder ?? _buildDefaultEmptyState())
                    : ListView.separated(
                        itemCount: children.length,
                        padding: const EdgeInsets.all(RSSpacing.md),
                        separatorBuilder: (context, index) => const SizedBox(height: 12.0),
                        itemBuilder: (context, index) => children[index],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Construye un widget de "estado vacío" por defecto en caso de no proveerse uno personalizado.
  Widget _buildDefaultEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(RSSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_rounded,
              color: Colors.black12,
              size: 48.0,
            ),
            RSSpacing.verticalSm,
            Text(
              'Sin Pedidos',
              style: RSTypography.labelMedium.copyWith(
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
