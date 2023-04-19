import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_roasting_admin/add_forms_admin/add_payment.dart';
import 'package:student_roasting_admin/admin_models/payment_models.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/datasource/paymentdatasource.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// ignore: depend_on_referenced_packages

//Local imports

class PaymentManagement extends StatefulWidget {
  const PaymentManagement({super.key});

  @override
  State<PaymentManagement> createState() => _PaymentManagementState();
}

class _PaymentManagementState extends State<PaymentManagement> {
  TextEditingController controller = TextEditingController();
  bool isShowUser = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 200,
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => AddPayment()));
          },
          child: Text("Add Payments"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 670,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: _buildDataGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  late PaymentDataSource employeeDataSource;
  List<PaymentModel> employeeData = [];

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('payments').snapshots();
  Widget _buildDataGrid() {
    return StreamBuilder(
      stream: getDataFromFireStore,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: LoadingAnimationWidget.hexagonDots(
                  color: Colors.blue, size: 200));
        }
        if (snapshot.hasData) {
          if (employeeData.isNotEmpty) {
            getDataGridRowFromDataBase(DocumentChange<Object?> data) {
              return DataGridRow(cells: [
                DataGridCell<String>(
                    columnName: 'fees', value: data.doc['fees']),
                DataGridCell<String>(
                    columnName: 'uuid', value: data.doc['uuid']),
                DataGridCell<String>(
                    columnName: 'recievedPayment',
                    value: data.doc['recievedPayment']),
                DataGridCell<String>(
                    columnName: 'remainingPayment',
                    value: data.doc['remainingPayment']),
                DataGridCell<String>(
                    columnName: 'studentname', value: data.doc['studentname']),
              ]);
            }

            for (var data in snapshot.data!.docChanges) {
              if (data.type == DocumentChangeType.modified) {
                if (data.oldIndex == data.newIndex) {
                  employeeDataSource.dataGridRows[data.oldIndex] =
                      getDataGridRowFromDataBase(data);
                }
                employeeDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.added) {
                employeeDataSource.dataGridRows
                    .add(getDataGridRowFromDataBase(data));
                employeeDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.removed) {
                employeeDataSource.dataGridRows.removeAt(data.oldIndex);
                employeeDataSource.updateDataGridSource();
              }
            }
          } else {
            for (var data in snapshot.data!.docs) {
              employeeData.add(PaymentModel(
                fees: data['fees'],
                uuid: data['uuid'],
                recievedPayment: data['recievedPayment'],
                remainingPayment: data['remainingPayment '],
                studentname: data['studentname'],
                dateTime: data['dateTime'],
              ));
            }
            employeeDataSource = PaymentDataSource(employeeData);
          }

          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SfDataGrid(
              source: employeeDataSource,
              columns: getColumnsItem,
              columnWidthMode: ColumnWidthMode.fill,
              onCellTap: (details) {
                if (details.rowColumnIndex.rowIndex != 0) {
                  final DataGridRow row = employeeDataSource
                      .effectiveRows[details.rowColumnIndex.rowIndex - 1];
                  int index = employeeDataSource.dataGridRows.indexOf(row);
                  var data = snapshot.data!.docs[index];
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => PaymentManagementView(data: data)));
                }
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
