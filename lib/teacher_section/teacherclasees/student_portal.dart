import 'package:flutter/material.dart';
import 'package:student_roasting_admin/add_forms_admin/add_student.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class StudentPortal extends StatefulWidget {
  /// Creates the home page.
  StudentPortal({Key? key}) : super(key: key);

  @override
  _StudentPortalState createState() => _StudentPortalState();
}

class _StudentPortalState extends State<StudentPortal> {
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
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(
        "James",
        'Class A',
        'Quran',
      ),
      Employee(
        "Kathryn",
        'Class B',
        'Arabic',
      ),
      Employee(
        "Lara",
        'Class C',
        'Quran',
      ),
      Employee(
        "Michael",
        'Class D',
        'Arabic',
      ),
      Employee(
        "Martin",
        'Class E',
        'Quran',
      ),
      Employee(
        "Newberry",
        'Class F',
        'Arabic',
      ),
      Employee(
        "Balnc",
        'Class G',
        'Quran',
      ),
      Employee(
        "Perry",
        'Class H',
        'Arabic',
      ),
      Employee(
        "Gable",
        'Class I',
        'Quran',
      ),
      Employee(
        "Grimes",
        'Class J',
        'Arabic',
      )
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
  );

  /// Id of an employee.
  final String studentName;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;
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
