import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/modle/Model_1.dart';


final _lightColors = [
  Color(0xff2B3B43),
  Color(0xff5E7845),
  Color(0xff9FA975),
  Color(0xff385E72),
  Color(0xffa8F4DC),
  Color(0xff6C6A61),



];

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.only(bottom: 50),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  time,
                  style: TextStyle(color: Color(0xffF8EA8C)),
                ),
              ),
              SizedBox(height: 4),
              Center(
                child: Text(
                  note.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 150;
      case 1:
        return 130;
      case 2:
        return 170;
      case 3:
        return 150;
      default:
        return 150;
    }
  }
}
