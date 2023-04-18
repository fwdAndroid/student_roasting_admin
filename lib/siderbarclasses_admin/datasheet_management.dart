import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:student_roasting_admin/add_forms_admin/add_datesheet.dart';
import 'package:student_roasting_admin/add_forms_admin/add_student.dart';
import 'package:student_roasting_admin/admin_models/datesheet_models.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/datasource/datesheetdatasource.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DateSheetManagement extends StatefulWidget {
  const DateSheetManagement({Key? key}) : super(key: key);

  @override
  State<DateSheetManagement> createState() => _DateSheetManagementState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class _DateSheetManagementState extends State<DateSheetManagement> {
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
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => AddDateSheet()));
          },
          child: Text("Make DateSheet"),
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

  late DateSheetManagementDataSource employeeDataSource;
  List<DateSheetModels> employeeData = [];

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('datesheet').snapshots();
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
                    columnName: 'className', value: data.doc['className']),
                DataGridCell<String>(
                    columnName: 'dateTime', value: data.doc['dateTime']),
                DataGridCell<String>(
                    columnName: 'uuid', value: data.doc['uuid']),
                DataGridCell<String>(columnName: 'day', value: data.doc['day']),
                DataGridCell<String>(
                    columnName: 'subject', value: data.doc['subject']),
                DataGridCell<int>(columnName: 'date', value: data.doc['date']),
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
              employeeData.add(DateSheetModels(
                  className: data['className'],
                  day: data['day'],
                  dateTime: data['dateTime'],
                  uuid: data['uuid'],
                  date: data['date'],
                  subject: data['subject'],
                  studentname: data['studentname']));
            }
            employeeDataSource = DateSheetManagementDataSource(employeeData);
          }

          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: SfDataGrid(
              selectionMode: SelectionMode.single,
              allowFiltering: true,
              allowSorting: true,
              source: employeeDataSource,
              columns: getColumnsDate,
              columnWidthMode: ColumnWidthMode.fill,
              onCellTap: (details) {
                if (details.rowColumnIndex.rowIndex != 0) {
                  final DataGridRow row = employeeDataSource
                      .effectiveRows[details.rowColumnIndex.rowIndex - 1];
                  int index = employeeDataSource.dataGridRows.indexOf(row);
                  var data = snapshot.data!.docs[index];
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => StudentView(data: data)));
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
