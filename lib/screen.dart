import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:80),
            child: Container(
              height: 90,
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 156, 196, 190)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: const Text(
                    " 📔 CARE PUBLIC SCHOOL \n                NEW DELHI",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 156, 196, 190)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: const Text("Half Yearly Examination Date Sheet class")),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(),
              columnWidths:{
                0:FractionColumnWidth(0.25),
                1:FractionColumnWidth(0.25),
                2:FractionColumnWidth(0.25),
              },
              children: [
                buildRow(['S.NO', 'DAY', 'DAY', 'SUBJECT']),
                buildRow(['1', '28.09.2002', 'MONDAY', 'ENGLISH'],isHeader: true),
                buildRow(['2', '28.09.2002', 'WEDNESDAY', 'MATH']),
                buildRow(['3', '28.09.2002', 'SATURDAY', 'ART']),
                buildRow(['5', '28.09.2002', 'MONDAY', 'HINDI']),
                buildRow(['6', '28.09.2002', 'FRIDAY', 'SCIENCE']),
                buildRow(['7', '28.09.2002', 'TUESDAY', 'GEOGRAPHY']),
                buildRow(['8', '28.09.2002', 'THURSDAY', 'SST']),
                buildRow(['9', '28.09.2002', 'THURSDAY', 'SANSKRIT']),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Note : ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        "Students can leave the school on completion of their after 11:15 \n am after showing I- card  at the school gate no.4",
                        style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              );
          return Padding(
            padding: const EdgeInsets.all(11),
            child: Center(child: Text(cell)),
          );
        }).toList(),
      );
}
