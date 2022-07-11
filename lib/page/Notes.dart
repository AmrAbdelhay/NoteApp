import 'package:flutter/material.dart';
import 'package:noteapp/database/Notes_data.dart';
import 'package:noteapp/modle/Model_1.dart';
import 'package:noteapp/page/Edit_data.dart';
import 'package:noteapp/page/delete_data.dart';
import 'package:noteapp/widget/Card_note.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Notes',
        style: TextStyle(fontSize: 24),
      ),
      // actions: [Icon(Icons.search), SizedBox(width: 12)],
    ),
    body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : notes.isEmpty
          ? Text(
        'No Notes',
        style: TextStyle(color: Colors.white, fontSize: 24),
      )
          : buildNotes(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddEditNotePage()),
        );

        refreshNotes();
      },
    ),
  );

     buildNotes() => Container(
       padding: EdgeInsets.all(10),
       child: StaggeredGridView.countBuilder(
    padding: EdgeInsets.all(20),
    itemCount: notes.length,

    staggeredTileBuilder: (index) => StaggeredTile.count(2, 2),

    crossAxisCount: 4,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,

    itemBuilder: (context, index) {
        final note = notes[index];

        return GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NoteDetailPage(noteId: note.id!),
            ));

            refreshNotes();
          },
          child: NoteCardWidget(note: note, index: index),
        );
    },
  )
     );
}
