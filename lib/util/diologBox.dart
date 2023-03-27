import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class MyDiolog extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  MyDiolog(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple.shade200,
      content: Container(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add anew Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onsave),
                const SizedBox(
                  width: 20,
                ),
                MyButton(text: "Cancel", onPressed: oncancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
