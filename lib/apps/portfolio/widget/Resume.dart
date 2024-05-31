import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CVUploadScreen extends StatefulWidget {
  @override
  _CVUploadScreenState createState() => _CVUploadScreenState();
}

class _CVUploadScreenState extends State<CVUploadScreen> {
  Uint8List? _uploadedCV;

  Future<void> _startFilePicker() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null) {
      setState(() {
        _uploadedCV = result.files.first.bytes;
      });
    }
  }

  Future<void> _openGoogleDrive() async {
    const googleDriveUrl = 'https://drive.google.com/drive/u/0/my-drive';
    if (await canLaunch(googleDriveUrl)) {
      await launch(googleDriveUrl);
    } else {
      // Handle error: unable to launch the URL
      print('Error opening Google Drive');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload CV')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_uploadedCV != null) Text('CV Uploaded!'),
            ElevatedButton(
              onPressed: _openGoogleDrive,
              child: Text('Select CV File'),
            ),
          ],
        ),
      ),
    );
  }
}
