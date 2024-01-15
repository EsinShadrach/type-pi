import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:type_pi/helpers/extensions/on_context.dart';
import 'package:type_pi/helpers/platform_specifics/text_field.dart';
import 'package:type_pi/providers/headers.dart';

class ShowMyDialogs {
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Consumer<HeadersProvider>(
        builder: (context, headersProvider, child) => Dialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      headersProvider.debugPrintHeaders();
                    },
                    child: const Text("Debug Print Headers"),
                  ),
                  Table(
                    border: TableBorder.all(
                      width: 10,
                    ),
                    children: List.generate(
                      headersProvider.headers.length,
                      (index) => TableRow(
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withOpacity(0.0),
                        ),
                        children: [
                          TextAreaForDialog(
                            text: headersProvider.headers[index].keys.first,
                            onChanged: (value) {
                              headersProvider.updateHeaderKey(index, value);
                              debugPrint(value);
                            },
                          ),
                          TextAreaForDialog(
                            text: headersProvider.headers[index].values.first,
                            onChanged: (value) {
                              headersProvider.updateHeaderKey(index, value);
                              debugPrint(value);
                            },
                          ),
                          // PlatformTextField(
                          //   padding: const EdgeInsets.all(20),
                          //   // value: headersProvider.headers[index].values.first,
                          //   obscureText: false,
                          //   enableSuggestions: true,
                          //   autocorrect: true,
                          //   placeholder: "Value",
                          //   onChanged: (value) {
                          //     // String val = value.reverse;
                          //     headersProvider.updateHeaderValue(index, value);
                          //     debugPrint(value);
                          //   },
                          // ),
                          IconButton(
                            onPressed: () {
                              headersProvider.removeRow(index);
                            },
                            icon: const Icon(Icons.remove_rounded),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            headersProvider.addRow();
                          },
                          icon: const Icon(Icons.add_rounded),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextAreaForDialog extends StatefulWidget {
  const TextAreaForDialog({
    super.key,
    required this.text,
    required this.onChanged,
  });

  final String text;
  final void Function(String) onChanged;

  @override
  State<TextAreaForDialog> createState() => _TextAreaForDialogState();
}

class _TextAreaForDialogState extends State<TextAreaForDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformTextField(
      controller: _controller,
      padding: const EdgeInsets.all(20),
      obscureText: false,
      enableSuggestions: true,
      autocorrect: true,
      placeholder: "Key",
      onChanged: widget.onChanged,
    );
  }
}
