import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uas_projek/ui/update_dialog.dart';
// import 'box_dialog.dart';

class TodoApp extends StatelessWidget {
  final String teksNama;
  final bool teksKomplit;
  final Function(bool?)? onChanged; //ini yang berubah
  final Function(BuildContext)? deleteFunction; //ini yang berubah
  final Function(String) updateFunction;

  TodoApp(
      {super.key,
      required this.teksNama,
      required this.teksKomplit,
      required this.onChanged,
      required this.deleteFunction,
      required this.updateFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete_outline,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.orange[800],
              borderRadius: BorderRadius.circular(10)),
          // height: 70,
          child: Row(
            children: [
              // cek box
              Checkbox(
                value: teksKomplit,
                onChanged: onChanged,
                activeColor: Colors.green[400],
              ),
              Text(
                teksNama,
                style: TextStyle(
                    decoration: teksKomplit
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 15,
                    color: teksKomplit ? Colors.green : Colors.white,
                    fontWeight: teksKomplit ? FontWeight.bold : FontWeight.w400),
              ),
              IconButton(
                icon:const Icon(Icons.edit_note_rounded),
                color: Colors.white,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return UpdateDialog(
                            initialValue: teksNama,
                            onUpdate: (newTeks) {
                              updateFunction(newTeks);
                            });
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
