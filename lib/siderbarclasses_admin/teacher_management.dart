import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:student_roasting_admin/add_forms_admin/add_teachers.dart';
import 'package:student_roasting_admin/admin_models/teacher_models.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/datasource/teacherdatasource.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/views/teacher_view.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TeacherManagement extends StatefulWidget {
  const TeacherManagement({super.key});

  @override
  State<TeacherManagement> createState() => _TeacherManagementState();
}

class _TeacherManagementState extends State<TeacherManagement> {
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
      floatingActionButton: Container(
        width: 200,
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => AddTeachers()));
          },
          child: Text("Add Teachers"),
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

  late TeacherDataSource employeeDataSource;
  List<TeacherModels> employeeData = [];

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('teachers').snapshots();
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
                    columnName: 'teacher_class',
                    value: data.doc['teacher_class']),
                DataGridCell<String>(
                    columnName: 'teacher_subjects',
                    value: data.doc['teacher_subjects']),
                DataGridCell<String>(
                    columnName: 'dateTime', value: data.doc['dateTime']),
                DataGridCell<String>(
                    columnName: 'uuid', value: data.doc['uuid']),
                DataGridCell<String>(
                    columnName: 'teacher_name',
                    value: data.doc['teacher_name']),
                DataGridCell<String>(
                    columnName: 'email', value: data.doc['email']),
                DataGridCell<String>(
                    columnName: 'password', value: data.doc['password']),
                DataGridCell<String>(
                    columnName: 'teacher_qualification',
                    value: data.doc['teacher_qualification']),
                DataGridCell<String>(
                    columnName: 'confrim_password',
                    value: data.doc['confrim_password']),
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
              employeeData.add(TeacherModels(
                teacher_subjects: data['teacher_subjects'],
                teacher_class: data['teacher_class'],
                dateTime: data['dateTime'],
                uuid: data['uuid'],
                teacher_name: data['teacher_name'],
                email: data['email'],
                password: data['password'],
                teacher_qualification: data['teacher_qualification'],
                confrim_password: data['confrim_password'],
              ));
            }
            employeeDataSource = TeacherDataSource(employeeData);
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TeacherView(data: data)));
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
