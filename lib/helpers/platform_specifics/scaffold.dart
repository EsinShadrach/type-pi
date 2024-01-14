import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:type_pi/helpers/extensions/on_context.dart';
import 'package:type_pi/helpers/platform_specifics/text_field.dart';
import 'package:type_pi/providers/base.dart';
import 'package:url_launcher/url_launcher.dart';

class PlatformScaffold extends StatelessWidget {
  const PlatformScaffold({
    super.key,
    required this.body,
    this.title,
    this.trailing,
  });

  final Widget body;
  final String? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    NavRailProvider railProvider = context.watch<NavRailProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: PlatformTextField(
                controller: TextEditingController(),
                obsureText: false,
                enableSuggestions: true,
                autocorrect: true,
                placeholder: "Enter a GET api endpoint",
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              tooltip: "API Settings",
              onPressed: () {
                // Show Api Settings like headers, body, etc. via modal
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedIconExample(
              isOpened: railProvider.isOpened,
              onPressed: () {
                railProvider.open();
              },
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton.icon(
              onPressed: () {
                openGithuburl();
              },
              icon: SvgPicture.asset(
                "assets/icons/github.svg",
                height: 24,
                colorFilter: ColorFilter.mode(
                    context.colorScheme.primary, BlendMode.srcIn),
                width: 24,
              ),
              label: const Text("Github"),
            ),
          ),
        ],
      ),
      body: SafeArea(child: body),
    );
  }
}

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({
    super.key,
    required this.onPressed,
    required this.isOpened,
  });

  final Function onPressed;
  final bool isOpened;

  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animatedController;

  @override
  void initState() {
    super.initState();
    _animatedController = AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
    );
  }

  void _handleTap() {
    widget.onPressed();
    setState(() {
      !widget.isOpened
          ? _animatedController.forward()
          : _animatedController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _handleTap,
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        color: context.colorScheme.primary,
        progress: _animatedController,
        // size: 72.0,
        semanticLabel: 'Show menu',
      ),
    );
  }
}

Future<void> openGithuburl() async {
  Uri url = Uri.parse('https://github.com/EsinShadrach/type-pi');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
