import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../src/widgets/navigation.dart';

@widgetbook.UseCase(name: 'Admin Drawer', type: RSAdminDrawer)
Widget buildAdminDrawerUseCase(BuildContext context) {
  return RSAdminDrawer(
    restaurantName: 'Mi Restaurante SaaS',
    branchName: 'Sucursal Norte',
    userName: 'Nicole',
    userRole: 'Ingeniera de Software',
    restaurantLogo: const Icon(Icons.storefront, color: Colors.black87),
    items: [
      RSNavigationItem(label: 'Dashboard', icon: Icons.space_dashboard_rounded, isActive: true, onTap: () {}),
      RSNavigationItem(label: 'Pedidos', icon: Icons.receipt_long, badgeText: '5', onTap: () {}),
      RSNavigationItem(label: 'Inventario', icon: Icons.inventory_2_outlined, onTap: () {}),
    ],
    onLogoutPressed: () {},
  );
}

@widgetbook.UseCase(name: 'Bottom Nav Mobile', type: RSAdminBottomNav)
Widget buildBottomNavUseCase(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: RSAdminBottomNav(
      currentIndex: 0,
      onTap: (index) {},
      items: [
        RSNavigationItem(label: 'Inicio', icon: Icons.home_rounded, onTap: () {}),
        RSNavigationItem(label: 'Pedidos', icon: Icons.receipt_long, badgeText: '2', onTap: () {}),
        RSNavigationItem(label: 'Ajustes', icon: Icons.settings, onTap: () {}),
      ],
    ),
  );
}