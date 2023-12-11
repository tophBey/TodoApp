import 'package:flutter/material.dart';
import 'package:uas_projek/ui/box_dialog.dart';
import 'package:uas_projek/ui/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // teks controller
  final _controller = TextEditingController();
  // list default todo
  List todoList = [
    // ["Membuat tutorial", false],
    // ["membuat makanan", false],
  ];

  // check box ketika di klik
  void checkBoxChange(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // save save TeksBaru
  void saveTeksBaru() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // membuat todo baru
  void createNewTeks() {
    showDialog(
        context: context,
        builder: (context) {
          return BoxDIalog(
            controller: _controller,
            onSave: saveTeksBaru,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  // delete todo task
  void deleteTeks(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  // update todo
  void updateTeks(String value, int index) {
    setState(() {
      todoList[index][0] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        title: const Text(
          "List Kegiatan Harian",
          textAlign: TextAlign.center,
        ),
        elevation: 0,
        backgroundColor: Colors.orange[800],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[800],
          child: Icon(Icons.add_box_rounded),
          onPressed: createNewTeks),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoApp(
            teksNama: todoList[index][0],
            teksKomplit: todoList[index][1],
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (contex) => deleteTeks(index),
            updateFunction: (value) => updateTeks(value, index),
          );
        },
        // children: [
        //   TodoApp(
        //     teksNama: "Membuat Kopi",
        //     teksKomplit: true,
        //     onChanged: (p0) {},
        //   ),
        // ],
      ),
    );
  }
}
