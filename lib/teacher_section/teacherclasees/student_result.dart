import 'package:flutter/material.dart';
import 'package:student_roasting_admin/add_forms_admin/add_student.dart';
import 'package:student_roasting_admin/teacher_section/teacherformsadd/add_teacher_result.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class StudentResult extends StatefulWidget {
  /// Creates the home page.
  StudentResult({Key? key}) : super(key: key);

  @override
  _StudentResultState createState() => _StudentResultState();
}

class _StudentResultState extends State<StudentResult> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
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
                MaterialPageRoute(builder: (builder) => AddTeacherResult()));
          },
          child: Text("Create Result"),
        ),
      ),
      body: SfDataGrid(
        source: employeeDataSource,
        selectionMode: SelectionMode.multiple,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'studentName',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Student Name',
                  ))),
          GridColumn(
              columnName: 'class',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Class'))),
          GridColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Subject',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'grade',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Grade',
                    overflow: TextOverflow.ellipsis,
                  ))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee("James", 'Class A', 'Quran', 'D'),
      Employee("Kathryn", 'Class B', 'Arabic', 'B'),
      Employee("Lara", 'Class C', 'Quran', 'A+'),
      Employee("Michael", 'Class D', 'Arabic', 'A'),
      Employee("Martin", 'Class E', 'Quran', 'A'),
      Employee("Newberry", 'Class F', 'Arabic', 'B'),
      Employee("Balnc", 'Class G', 'Quran', 'A'),
      Employee("Perry", 'Class H', 'Arabic', 'C'),
      Employee("Gable", 'Class I', 'Quran', 'B'),
      Employee("Grimes", 'Class J', 'Arabic', 'A')
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(
    this.studentName,
    this.name,
    this.designation,
    this.grade,
  );

  /// Id of an employee.
  final String studentName;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;
  final String grade;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'studentName', value: e.studentName),
              DataGridCell<String>(columnName: 'class', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<String>(columnName: 'grade', value: e.grade),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
