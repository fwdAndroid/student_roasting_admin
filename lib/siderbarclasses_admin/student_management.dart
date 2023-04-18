import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:student_roasting_admin/add_forms_admin/add_student.dart';
import 'package:student_roasting_admin/admin_models/student_model.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/datasource/studentdatasource.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/views/student_view.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StudentManagement extends StatefulWidget {
  const StudentManagement({Key? key}) : super(key: key);

  @override
  State<StudentManagement> createState() => _StudentManagementState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class _StudentManagementState extends State<StudentManagement> {
  TextEditingController controller = TextEditingController();
  bool isShowUser = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BestTutorSite _site = BestTutorSite.javatpoint;
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
                context, MaterialPageRoute(builder: (builder) => AddStudent()));
          },
          child: Text("Add Stuents"),
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

  late StudentManagementDataSource employeeDataSource;
  List<StudentModel> employeeData = [];

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('students').snapshots();
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
                    columnName: 'addressStudent',
                    value: data.doc['addressStudent']),
                DataGridCell<String>(
                    columnName: 'studentStatus',
                    value: data.doc['studentStatus']),
                DataGridCell<String>(
                    columnName: 'dateTime', value: data.doc['dateTime']),
                // DataGridCell<String>(columnName: 'pcs', value: data.doc['pcs']),
                DataGridCell<String>(
                    columnName: 'uuid', value: data.doc['uuid']),

                DataGridCell<String>(
                    columnName: 'parentemail', value: data.doc['parentemail']),
                DataGridCell<String>(
                    columnName: 'parentmobile',
                    value: data.doc['parentmobile']),
                DataGridCell<String>(
                    columnName: 'parentname', value: data.doc['parentname']),

                DataGridCell<String>(
                    columnName: 'studentclass',
                    value: data.doc['studentclass']),
                DataGridCell<String>(
                    columnName: 'subject', value: data.doc['subject']),
                DataGridCell<int>(columnName: 'fees', value: data.doc['fees']),
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
              employeeData.add(StudentModel(
                  addressStudent: data['addressStudent'],
                  studentStatus: data['studentStatus'],
                  dateTime: data['dateTime'],
                  uuid: data['uuid'],
                  parentemail: data['parentemail'],
                  parentmobile: data['parentmobile'],
                  parentname: data['parentname'],
                  studentclass: data['studentclass'],
                  subject: data['subject'],
                  fees: data['fees'],
                  studentname: data['studentname']));
            }
            employeeDataSource = StudentManagementDataSource(employeeData);
          }

          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: SfDataGrid(
              selectionMode: SelectionMode.single,
              allowFiltering: true,
              allowSorting: true,
              source: employeeDataSource,
              columns: getColumnsOrder,
              columnWidthMode: ColumnWidthMode.fill,
              onCellTap: (details) {
                if (details.rowColumnIndex.rowIndex != 0) {
                  final DataGridRow row = employeeDataSource
                      .effectiveRows[details.rowColumnIndex.rowIndex - 1];
                  int index = employeeDataSource.dataGridRows.indexOf(row);
                  var data = snapshot.data!.docs[index];
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StudentView(data: data)));
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
