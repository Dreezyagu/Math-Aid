import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Notes extends StatefulWidget {
  final String title;

  Notes(this.title);

  @override
  _NotesState createState() => _NotesState(this.title);
}

class _NotesState extends State<Notes> {
  String title;

  _NotesState(this.title);

  bool _isLoading = true;
  PDFDocument documents;

  @override
  void initState() {
    super.initState();
    loadDocuments(title);
  }

  loadDocuments(title) async {
    documents = await PDFDocument.fromAsset('assets/$title.pdf');

    setState(() {
      _isLoading = false;
    });
  }

//  loadPDFAssets(title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Center(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : PDFViewer(document: documents)));
  }
}
