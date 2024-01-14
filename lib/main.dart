import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:type_pi/helpers/platform_specifics/material_or_cupertino.dart';
import 'package:type_pi/helpers/platform_specifics/scaffold.dart';
import 'package:type_pi/helpers/widgets/sidebar.dart';
import 'package:type_pi/providers/base.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavRailProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const PlatformDependentWidget(
      title: 'Type-Pi',
      home: MyHomePage(title: 'Type-Pi'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SideBar(),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
