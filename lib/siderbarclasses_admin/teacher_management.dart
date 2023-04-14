import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class TeacherManagement extends StatefulWidget {
  /// Creates the home page.
  TeacherManagement({Key? key}) : super(key: key);

  @override
  _TeacherManagementState createState() => _TeacherManagementState();
}

class _TeacherManagementState extends State<TeacherManagement> {
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
      body: SfDataGrid(
        source: employeeDataSource,
        selectionMode: SelectionMode.multiple,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'teacherName',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Teacher Name',
                  ))),
          GridColumn(
              columnName: 'email',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Email'))),
          GridColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Password',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'salary',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary'))),
          GridColumn(
              columnName: 'status',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Subjects'))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee("James", 'fwdkaleem@gmail.com', '124577', 20000, "Arabic"),
      Employee("Kathryn", 'fwdkaleem@gmail.com', '124577', 30000, "Quran"),
      Employee("Lara", 'fwdkaleem@gmail.com', '124577', 15000, "Arabic"),
      Employee("Michael", 'fwdkaleem@gmail.com', '124577', 15000, "Quran"),
      Employee("Martin", 'fwdkaleem@gmail.com', '124577', 15000, "Arabic"),
      Employee("Newberry", 'fwdkaleem@gmail.com', '124577', 15000, "Quran"),
      Employee("Balnc", 'fwdkaleem@gmail.com', '124577', 15000, "Arabic"),
      Employee("Perry", 'fwdkaleem@gmail.com', '124577', 15000, "Quran"),
      Employee("Gable", 'fwdkaleem@gmail.com', '124577', 15000, "Quran"),
      Employee("Grimes", 'fwdkaleem@gmail.com', '124577', 15000, "Quran")
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(
      this.teacherName, this.name, this.designation, this.salary, this.status);

  /// Id of an employee.
  final String teacherName;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;

  final String status;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'teacherName', value: e.teacherName),
              DataGridCell<String>(columnName: 'email', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
              DataGridCell<String>(columnName: 'status', value: e.status),
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
