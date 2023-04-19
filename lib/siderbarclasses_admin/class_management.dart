import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:student_roasting_admin/add_forms_admin/add_teachers.dart';
import 'package:student_roasting_admin/add_forms_admin/assigned_class.dart';
import 'package:student_roasting_admin/admin_models/class_model.dart';
import 'package:student_roasting_admin/admin_models/teacher_models.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/datasource/classassigneddatasource.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/views/teacher_view.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ClassManagement extends StatefulWidget {
  const ClassManagement({super.key});

  @override
  State<ClassManagement> createState() => _ClassManagementState();
}

class _ClassManagementState extends State<ClassManagement> {
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
    return Scaffold(
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

  late ClassDataSource employeeDataSource;
  List<ClassModels> employeeData = [];

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('assignedClass').snapshots();
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
                    columnName: 'studentClass',
                    value: data.doc['studentClass']),
                DataGridCell<String>(
                    columnName: 'dateTime', value: data.doc['dateTime']),
                DataGridCell<String>(
                    columnName: 'studentName', value: data.doc['studentName']),
                DataGridCell<String>(
                    columnName: 'teacher_name',
                    value: data.doc['teacher_name']),
                DataGridCell<String>(
                    columnName: 'studentSubject',
                    value: data.doc['studentSubject']),
                DataGridCell<String>(
                    columnName: 'uuid', value: data.doc['uuid']),
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
              employeeData.add(ClassModels(
                teacherUid: data['teacherUid'],
                uuid: data['uuid'],
                studentSubject: data['studentSubject'],
                studentName: data['studentName'],
                studentClass: data['studentClass'],
                dateTime: data['dateTime'],
                teacher_name: data['teacher_name'],
              ));
            }
            employeeDataSource = ClassDataSource(employeeData);
          }

          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SfDataGrid(
              selectionMode: SelectionMode.single,
              allowFiltering: true,
              allowSorting: true,
              source: employeeDataSource,
              columns: getColumnsBusiness,
              columnWidthMode: ColumnWidthMode.fill,
              onCellTap: (details) {
                if (details.rowColumnIndex.rowIndex != 0) {
                  final DataGridRow row = employeeDataSource
                      .effectiveRows[details.rowColumnIndex.rowIndex - 1];
                  int index = employeeDataSource.dataGridRows.indexOf(row);
                  var data = snapshot.data!.docs[index];
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => TeacherView(data: data)));
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
