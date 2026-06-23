import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Modelo de datos para representar una opción de navegación en el Design System.
class RSNavigationItem {
  /// Etiqueta de texto de la opción.
  final String label;

  /// Icono que representa la opción.
  final IconData icon;

  /// Callback que se dispara cuando el usuario selecciona esta opción.
  final VoidCallback onTap;

  /// Indica si esta opción es la activa en la pantalla actual.
  final bool isActive;

  /// Badge opcional para mostrar notificaciones o contadores (p. ej. "9" pedidos pendientes).
  final String? badgeText;

  const RSNavigationItem({
    required this.label,
    required this.icon,
    required this.onTap,
    this.isActive = false,
    this.badgeText,
  });
}

/// Cajón de navegación lateral (Drawer) premium y responsive para el panel de administración.
/// 
/// Diseñado para pantallas de escritorio, tablets o paneles deslizables móviles:
/// * Encabezado con logotipo del restaurante, nombre de la marca e información de la sucursal (branch).
/// * Cuerpo con lista scrollable de opciones de navegación [RSNavigationItem].
/// * Resaltado del item activo con el color primario de RestauranteSaas.
/// * Pie de página opcional que muestra el perfil del usuario logueado.
class RSAdminDrawer extends StatelessWidget {
  /// Lista de opciones de navegación que se renderizarán en el Drawer.
  final List<RSNavigationItem> items;

  /// Widget que representa el logotipo del restaurante (p. ej. un [Image.asset] o [CircleAvatar]).
  final Widget restaurantLogo;

  /// Nombre del restaurante.
  final String restaurantName;

  /// Nombre o identificador de la sucursal activa.
  final String branchName;

  /// Nombre del usuario logueado en la aplicación (opcional).
  final String? userName;

  /// Rol del usuario logueado (p. ej., "Administrador", "Chef") (opcional).
  final String? userRole;

  /// Widget de avatar opcional para el usuario.
  final Widget? userAvatar;

  /// Callback opcional que se ejecuta cuando el usuario pulsa en el botón de cerrar sesión o perfil.
  final VoidCallback? onLogoutPressed;

  const RSAdminDrawer({
    super.key,
    required this.items,
    required this.restaurantLogo,
    required this.restaurantName,
    required this.branchName,
    this.userName,
    this.userRole,
    this.userAvatar,
    this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: RSColors.surfaceContainerLowest,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Cabecera: Logotipo del restaurante y sucursal
            Padding(
              padding: const EdgeInsets.all(RSSpacing.lg),
              child: Row(
                children: [
                  // Contenedor circular del logo
                  Container(
                    height: 52.0,
                    width: 52.0,
                    decoration: BoxDecoration(
                      color: RSColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: RSColors.outlineVariant,
                        width: 1.0,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Center(child: restaurantLogo),
                  ),
                  RSSpacing.horizontalMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurantName,
                          style: RSTypography.titleMedium.copyWith(
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        RSSpacing.verticalXs,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          decoration: BoxDecoration(
                            color: RSColors.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            branchName,
                            style: RSTypography.labelSmall.copyWith(
                              color: RSColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: RSColors.outlineVariant, height: 1.0),
            
            RSSpacing.verticalMd,

            // Cuerpo: Items de navegación
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                padding: const EdgeInsets.symmetric(horizontal: RSSpacing.sm),
                separatorBuilder: (context, index) => const SizedBox(height: 4.0),
                itemBuilder: (context, index) {
                  final item = items[index];

                  // Estilo dinámico si está activo
                  final Color tileColor = item.isActive 
                      ? RSColors.primary.withValues(alpha: 0.08) 
                      : Colors.transparent;
                  final Color iconColor = item.isActive 
                      ? RSColors.primary 
                      : RSColors.textOnSurfaceVariant;
                  final Color textColor = item.isActive 
                      ? RSColors.primary 
                      : Colors.black87;
                  final FontWeight textFontWeight = item.isActive 
                      ? FontWeight.w700 
                      : FontWeight.w500;

                  return Container(
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      onTap: item.onTap,
                      leading: Icon(
                        item.icon,
                        color: iconColor,
                        size: 22.0,
                      ),
                      title: Text(
                        item.label,
                        style: RSTypography.bodyMedium.copyWith(
                          color: textColor,
                          fontWeight: textFontWeight,
                        ),
                      ),
                      // Badge de notificaciones opcional
                      trailing: item.badgeText != null
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 2.0,
                              ),
                              decoration: BoxDecoration(
                                color: RSColors.error,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                item.badgeText!,
                                style: RSTypography.labelSmall.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minLeadingWidth: 24.0,
                      dense: true,
                    ),
                  );
                },
              ),
            ),

            // Pie de página: Perfil de usuario y logout
            if (userName != null) ...[
              const Divider(color: RSColors.outlineVariant, height: 1.0),
              Padding(
                padding: const EdgeInsets.all(RSSpacing.md),
                child: Row(
                  children: [
                    userAvatar ??
                        CircleAvatar(
                          backgroundColor: RSColors.primary.withValues(alpha: 0.1),
                          foregroundColor: RSColors.primary,
                          radius: 18.0,
                          child: Text(
                            userName!.substring(0, 1).toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                    RSSpacing.horizontalMd,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName!,
                            style: RSTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (userRole != null)
                            Text(
                              userRole!,
                              style: RSTypography.bodySmall.copyWith(
                                color: Colors.black54,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                    if (onLogoutPressed != null)
                      IconButton(
                        onPressed: onLogoutPressed,
                        icon: const Icon(
                          Icons.logout_rounded,
                          color: RSColors.primary,
                          size: 20.0,
                        ),
                        tooltip: 'Cerrar Sesión',
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Barra de navegación inferior móvil elegante para RestauranteSaas.
/// 
/// Reemplaza la barra inferior estándar de Flutter con un diseño flotante premium:
/// * Transiciones sutiles y animadas entre pestañas.
/// * Estética premium que destaca el elemento activo con colores primarios.
/// * Compatible con badges de notificación integrados en cada opción.
class RSAdminBottomNav extends StatelessWidget {
  /// Lista de opciones de navegación a renderizar en la barra.
  final List<RSNavigationItem> items;

  /// El índice de la opción actualmente activa.
  final int currentIndex;

  /// Altura de la barra inferior. Por defecto es 68.0.
  final double height;

  /// Color de fondo de la barra. Por defecto es [RSColors.surfaceContainerLowest] (blanco).
  final Color backgroundColor;

  /// Callback ejecutado cuando se selecciona un nuevo índice.
  final ValueChanged<int> onTap;

  const RSAdminBottomNav({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.height = 72.0,
    this.backgroundColor = RSColors.surfaceContainerLowest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: const Border(
          top: BorderSide(
            color: RSColors.outlineVariant,
            width: 1.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final bool isSelected = index == currentIndex;

          final Color iconColor = isSelected ? RSColors.primary : Colors.black45;
          final Color textColor = isSelected ? RSColors.primary : Colors.black45;
          final double iconSize = isSelected ? 24.0 : 22.0;

          return Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  onTap(index);
                  item.onTap();
                },
                splashColor: RSColors.primary.withValues(alpha: 0.04),
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icono con soporte de badge
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        AnimatedScale(
                          scale: isSelected ? 1.1 : 1.0,
                          duration: const Duration(milliseconds: 150),
                          child: Icon(
                            item.icon,
                            color: iconColor,
                            size: iconSize,
                          ),
                        ),
                        if (item.badgeText != null)
                          Positioned(
                            top: -4,
                            right: -8,
                            child: Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: const BoxDecoration(
                                color: RSColors.error,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 14,
                                minHeight: 14,
                              ),
                              child: Text(
                                item.badgeText!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    // Texto
                    Text(
                      item.label,
                      style: RSTypography.labelSmall.copyWith(
                        color: textColor,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
