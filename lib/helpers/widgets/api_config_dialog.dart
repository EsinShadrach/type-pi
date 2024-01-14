import 'package:flutter/material.dart';
import 'package:type_pi/helpers/extensions/on_context.dart';
import 'package:type_pi/helpers/platform_specifics/text_field.dart';

class ShowMyDialogs {
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Table(
                border: TableBorder.all(
                  width: 10,
                ),
                children: List.generate(
                  3,
                  (index) => TableRow(
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withOpacity(0.0),
                    ),
                    children: [
                      PlatformTextField(
                        padding: const EdgeInsets.all(20),
                        controller: TextEditingController(),
                        obsureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        placeholder: "Key",
                      ),
                      PlatformTextField(
                        padding: const EdgeInsets.all(20),
                        controller: TextEditingController(),
                        obsureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        placeholder: "Value",
                      ),
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
                        debugPrint("Add new row");
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
