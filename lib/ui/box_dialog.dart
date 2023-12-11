import 'package:flutter/material.dart';
import 'package:uas_projek/buttons/button.dart';

class BoxDIalog extends StatelessWidget {
  final controller;
  final VoidCallback onSave;//ini yang dirubah
  final VoidCallback onCancel;//ini yang dirubah
 const BoxDIalog({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange,
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration:const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Tambahkan Kegiatan Baru"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(teks: "Save", diTekan: onSave),
              MyButton(teks: "Cancel", diTekan: onCancel),
            ],
          )
        ]),
      ),
    );
  }
}
