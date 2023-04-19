import 'package:flutter/material.dart';
import 'package:student_roasting_admin/admin_models/class_model.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ClassDataSource extends DataGridSource {
  ClassDataSource(this.employeeData) {
    _buildDataRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<ClassModels> employeeData;

  void _buildDataRow() {
    dataGridRows = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'teacher_name', value: e.teacher_name),
              DataGridCell<String>(
                  columnName: 'studentName', value: e.studentName),
              DataGridCell<String>(
                  columnName: 'studentClass', value: e.studentClass),
              DataGridCell<String>(
                  columnName: 'studentSubject', value: e.studentSubject),
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

List<GridColumn> get getColumnsBusiness {
  return <GridColumn>[
    GridColumn(
        columnName: 'teacher_name',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Name'))),
    GridColumn(
        columnName: 'studentName',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Student Name',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'studentClass',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Assigned Class'))),
    GridColumn(
        columnName: 'studentSubject ',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Subject'))),
  ];
}
