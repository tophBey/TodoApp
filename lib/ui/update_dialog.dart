import 'package:flutter/material.dart';
import '../buttons/button.dart';

class UpdateDialog extends StatelessWidget {
  final String initialValue;
  final Function(String) onUpdate;
  final TextEditingController _updateController = TextEditingController();

  UpdateDialog({super.key, required this.initialValue, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    _updateController.text = initialValue; // Set nilai awal ke dalam TextField

    return AlertDialog(
      backgroundColor: Colors.orange,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: _updateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Update Kegiatan",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  teks: "Update",
                  diTekan: () {
                    onUpdate(_updateController.text); // Panggil onUpdate dengan teks baru
                    Navigator.of(context).pop();
                  },
                ),
                MyButton(
                  teks: "Cancel",
                  diTekan: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
