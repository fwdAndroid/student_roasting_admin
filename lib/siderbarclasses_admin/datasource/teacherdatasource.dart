import 'package:flutter/material.dart';
import 'package:student_roasting_admin/admin_models/teacher_models.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TeacherDataSource extends DataGridSource {
  TeacherDataSource(this.employeeData) {
    _buildDataRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<TeacherModels> employeeData;

  void _buildDataRow() {
    dataGridRows = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'teacher_name', value: e.teacher_name),
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(columnName: 'password', value: e.password),
              DataGridCell<String>(
                  columnName: 'teacher_subjects', value: e.teacher_subjects),
              DataGridCell<String>(
                  columnName: 'teacher_qualification',
                  value: e.teacher_qualification),
              DataGridCell(columnName: 'teacher_class', value: e.teacher_class)
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
        columnName: 'email',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Email',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'password',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Password'))),
    GridColumn(
        columnName: 'teacher_subjects ',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Subjects'))),
    GridColumn(
        columnName: 'teacher_qualification ',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Qualifications'))),
    GridColumn(
        columnName: 'teacher_class ',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Class')))
  ];
}
