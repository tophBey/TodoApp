import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String teks;
  final VoidCallback diTekan; //ini yang di ubah
  MyButton({super.key, 
    required this.teks,
    required this.diTekan
  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: MaterialButton(
        onPressed: diTekan,
        color: Colors.orange,
        child: Text(teks,style: TextStyle(
          color: Colors.white),),
      
      ),
    );
  }
}
