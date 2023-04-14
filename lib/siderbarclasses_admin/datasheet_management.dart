import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class DateSheetManagement extends StatefulWidget {
  /// Creates the home page.
  DateSheetManagement({Key? key}) : super(key: key);

  @override
  _DateSheetManagementState createState() => _DateSheetManagementState();
}

class _DateSheetManagementState extends State<DateSheetManagement> {
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
        selectionMode: SelectionMode.multiple,
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'teacherName',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Class Name',
                  ))),
          GridColumn(
              columnName: 'email',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Subject'))),
          GridColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Date',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'salary',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Day'))),
          GridColumn(
              columnName: 'status',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Student Name'))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee("Class A", 'Quran', '23-Dec-2023', "Wednesday", "Qasim"),
      Employee("Class A", 'Arabic', '23-Dec-2023', "Wednesday", "Ali"),
      Employee("Class A", 'Quran', '23-Dec-2023', "Wednesday", "Asad"),
      Employee("Class B", 'Arabic', '23-Dec-2023', "Wednesday", "Fawad"),
      Employee("Class A", 'Quran', '23-Dec-2023', "Wednesday", "Ali"),
      Employee("Class C", 'Arabic', '23-Dec-2023', "Wednesday", "Zain"),
      Employee("Class D", 'Arabic', '23-Dec-2023', "Wednesday", "Azlo"),
      Employee("Class C", 'Arabic', '23-Dec-2023', "Wednesday", "Fawad"),
      Employee("Class B", 'Arabic', '23-Dec-2023', "Wednesday", "Qasim"),
      Employee("Class A", 'Quran', '23-Dec-2023', "Wednesday", "Sohaib")
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
  final String salary;

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
              DataGridCell<String>(columnName: 'salary', value: e.salary),
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
