import 'package:flutter/material.dart';
import 'package:student_roasting_admin/admin_models/payment_models.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PaymentDataSource extends DataGridSource {
  PaymentDataSource(this.employeeData) {
    _buildDataRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<PaymentModel> employeeData;

  void _buildDataRow() {
    dataGridRows = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'studentname', value: e.studentname),
              DataGridCell<String>(
                  columnName: 'fees', value: e.fees.toString()),
              DataGridCell<String>(
                  columnName: 'recievedPayment',
                  value: e.recievedPayment.toString()),
              DataGridCell<String>(
                  columnName: 'remainingPayment ',
                  value: e.remainingPayment.toString()),
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

List<GridColumn> get getColumnsItem {
  return <GridColumn>[
    GridColumn(
        columnName: 'studentname',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Student Name'))),
    GridColumn(
        columnName: 'fees',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Total Fees',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'recievedPayment',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Received Payment'))),
    GridColumn(
        columnName: 'remainingPayment ',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Remaining'))),
  ];
}
