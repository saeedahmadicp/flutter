import 'package:flutter/material.dart';
import 'package:online_testing_service/components/brain_class.dart';
import 'package:online_testing_service/constants.dart';
import 'student_screen.dart';

class MeritListScreen extends StatefulWidget {
  final List<StudentsRecord> list;
  MeritListScreen({this.list});

  @override
  _MeritListScreenState createState() => _MeritListScreenState();
}

class _MeritListScreenState extends State<MeritListScreen> {
  DataTable buildDataTable() {
    return DataTable(
      columns: [
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15.0,
              color: Colors.deepOrange,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Test Name',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15.0,
              color: Colors.deepOrange,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'score',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15.0,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ],
      rows: buildListDataRow(widget.list),
    );
  }

  List<DataRow> buildListDataRow(List<StudentsRecord> studentsData) {
    List<DataRow> listDataRow = [];
    for (var data in studentsData) {
      listDataRow.add(
        DataRow(cells: [
          DataCell(
            Text(
              '${data.firstName} ${data.lastName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          DataCell(
            Text(
              '${data.testName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          DataCell(
            Text(
              '${data.score}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
        ]),
      );
    }
    return listDataRow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => StudentScreen()),
              (route) => false);
        },
        appBarTitle: 'Merit List',
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(15.0),
          children: [
            buildDataTable(),
          ],
          //buildContainerWidgets(widget.list),
        ),
      ),
    );
  }
}
