import 'package:flutter/material.dart';

void main() => runApp(NotesApp());

class NotesApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotesAppState();
  }
}

var editNote = false;

class _NotesAppState extends State<NotesApp> {
  void _addNoteContainer() {
    setState(() {
      if (editNote)
        editNote = false;
      else
        editNote = true;
      _notesList.add(_noteContainer());
    });
  }

  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 50, keepScrollOffset: false);
  // ScrollController asa =
  //     ScrollController(initialScrollOffset: 10, keepScrollOffset: true);

  List<dynamic> _notesList = [];

// TODO: Use Card Widget for notes and use eleveation property.

  Widget _noteContainer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Scrollbar(
        controller: _scrollController,
        // isAlwaysShown: true,
        child: TextField(
          enabled: editNote,
          scrollController: _scrollController,
          autofocus: true,
          keyboardType: TextInputType.multiline,
          maxLines: 2,
          // autocorrect: true,
          onChanged: (s) => {},
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter notes..',
            // border: InputBorder.none,
            // isDense: true,
          ),
        ),
      ),
    );
  }

  Widget _notContainer() {
    return Container(
      height: 80,
      margin: EdgeInsets.only(top: 5, left: 8, right: 8),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.orangeAccent[100],
      ),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/71/83/70/7183704aac01413c86805c19c1586e2b.jpg"),
            ),
          ),
          title: Text(
            "Freedom Fighter",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple),
          ),
          subtitle: Text(
            'Freedom Fighter',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
          trailing: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('5',
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    SizedBox(
                      width: 1,
                    ),
                    Icon(
                      Icons.access_alarms_outlined,
                      textDirection: TextDirection.rtl,
                      size: 20,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('NOTES'),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 23,
            color: Colors.white,
          ),
          // foregroundColor: Colors.black,
          backgroundColor: Color.fromRGBO(232, 219, 97, 1),
        ),
        body: Column(
          children: <Widget>[
            // Container(
            //     width: double.infinity,
            //     margin: EdgeInsets.all(15),
            //     padding: EdgeInsets.all(15),
            //     color: Color.fromARGB(179, 230, 228, 228),
            //     child: Text(
            //       "Hello",
            //       textAlign: TextAlign.center,
            //     )),
            ..._notesList,
            // _noteContainer,
            // ElevatedButton(
            //   onPressed: null,
            //   child: Text("Add Note"),
            // )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addNoteContainer,
          tooltip: "Add Note",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
