import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_pdf/screen.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class User {
  final String Subject;
  final int date;
  final int sno;
  final String day;

  const User(
      {required this.date,
      required this.day,
      required this.sno,
      required this.Subject});
}

class pdfApi {
  static Future<File> generateTable() async {
    final pdf = Document();
    final imgpng =
        (await rootBundle.load('assets/book.png')).buffer.asUint8List();

    final headers = ['S.NO', 'DATE', 'DAY', 'SUBJECT'];

    final users = [
      User(sno: 1, date: 28092022, day: 'MONDAY', Subject: 'ENGLISH'),
      User(sno: 2, date: 28092022, day: 'TUESDAY', Subject: 'Math'),
      User(sno: 3, date: 28092022, day: 'WEDNESDAY', Subject: 'ART'),
      User(sno: 4, date: 28092022, day: 'SATURDAY', Subject: 'HINDI'),
      User(sno: 5, date: 28092022, day: 'MONDAY', Subject: 'SCINCE'),
      User(sno: 6, date: 28092022, day: 'TUESDAY', Subject: 'GEOGRAPHY'),
      User(sno: 7, date: 28092022, day: 'THRUSDAY', Subject: 'SST'),
      User(sno: 8, date: 28092022, day: 'MONDAY', Subject: 'SANSKRIT'),
    ];
    final data = users
        .map((user) => [user.sno, user.date, user.day, user.Subject])
        .toList();

    pdf.addPage(MultiPage(
        build: (context) => <Widget>[
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(color: PdfColors.amber200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: Center(
                  //   // child: Text(
                  //   //   " 📔 CARE PUBLIC SCHOOL \n                NEW DELHI",
                  //   //   style: TextStyle(fontSize: 20),
                  //   // ),
                  // ),
                  child: Row(children: [
                    Container(
                      child: Image()
                    )
                  ])
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: PdfColors.amber800),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text("Half Yearly Examination Date Sheet class",
                          style: TextStyle(fontSize: 15))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table.fromTextArray(
                      headers: headers,
                      data: data,
                      cellHeight: 40,
                      cellAlignment: Alignment.center,
                      headerHeight: 30,
                      cellStyle: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 17))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Note : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "Students can leave the school on completion of their after 11:15 \n am after showing I- card  at the school gate no.4",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              )
            ]));

    // pdf.addPage(Page(
    //   build: (context) => Table.fromTextArray(
    //     headers: headers,
    //     data: data,
    //   ),
    // ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
