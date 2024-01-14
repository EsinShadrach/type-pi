import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:type_pi/providers/base.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final railProvider = context.watch<NavRailProvider>();
    return NavigationRail(
      useIndicator: true,
      extended: railProvider.isOpened,
      onDestinationSelected: (index) {
        railProvider.selectIndex(index);
      },
      destinations: const [
        NavigationRailDestination(
          indicatorColor: Colors.red,
          icon: Icon(Icons.code),
          label: Text('Date'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.code),
          label: Text('Date'),
        )
      ],
      selectedIndex: railProvider.selectedIndex,
    );
  }
}
