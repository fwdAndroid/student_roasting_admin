import 'package:flutter/material.dart';
import 'package:student_roasting_admin/admin_models/student_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:intl/intl.dart';

class StudentManagementDataSource extends DataGridSource {
  StudentManagementDataSource(this.employeeData) {
    _buildDataRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<StudentModel> employeeData;

  void _buildDataRow() {
    dataGridRows = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'dateTime',
                  value: DateFormat.yMMMMd().format(
                      DateTime.fromMillisecondsSinceEpoch(
                          int.parse(e.dateTime)))),
              DataGridCell<String>(
                  columnName: 'studentname', value: e.studentname),
              DataGridCell<String>(
                  columnName: 'parentname', value: e.parentname),
              DataGridCell<String>(
                  columnName: 'parentmobile', value: e.parentmobile),
              DataGridCell(columnName: 'subject', value: e.subject),
              DataGridCell<String>(
                  columnName: 'fees', value: e.fees.toString()),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}

List<GridColumn> get getColumnsOrder {
  //   DataGridCell<String>(columnName: 'uid', value: e.id),
  // DataGridCell<String>(columnName: 'name', value: e.name),
  // DataGridCell<String>(columnName: 'gender', value: e.gender),
  // DataGridCell<String>(columnName: 'email', value: e.email),
  // DataGridCell<String>(columnName: 'dob', value: e.dob),
  // DataGridCell<String>(columnName: 'phoneNumber', value: e.phone),
  return <GridColumn>[
    GridColumn(
        columnName: 'dateTime',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Admission Date'))),
    GridColumn(
        columnName: 'studentname',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Student Name'))),
    GridColumn(
        columnName: 'parentname',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Parent Name',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'parentmobile',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Mobile Number'))),
    GridColumn(
        columnName: 'subject',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Subject'))),
    GridColumn(
        columnName: 'fees ',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Fees'))),
  ];
}
