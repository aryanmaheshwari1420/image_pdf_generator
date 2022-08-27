import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_pdf/pdfApi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate PDF"),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                final pdfFile = await pdfApi.generateTable();
                pdfApi.openFile(pdfFile);
              },
              child: Text("Create Table"))
        ],
      )),
    );
  }
}
