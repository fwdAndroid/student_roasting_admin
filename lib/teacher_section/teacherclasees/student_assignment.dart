import 'package:flutter/material.dart';
import 'package:student_roasting_admin/add_forms_admin/add_student.dart';
import 'package:student_roasting_admin/teacher_section/teacherformsadd/add_student_assignment.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class StudentAssignment extends StatefulWidget {
  /// Creates the home page.
  StudentAssignment({Key? key}) : super(key: key);

  @override
  _StudentAssignmentState createState() => _StudentAssignmentState();
}

class _StudentAssignmentState extends State<StudentAssignment> {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => AddStudentAssignment()));
          },
          child: Text("Send Assignment"),
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
                    'Assignment Name',
                  ))),
          GridColumn(
              columnName: 'class',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Student Name'))),
          GridColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Class',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'subject',
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
        'Read Quran',
        "James",
        'Class A',
        'Quran',
      ),
      Employee(
        'Read Quran',
        "Kathryn",
        'Class B',
        'Arabic',
      ),
      Employee(
        'Read Quran',
        "Lara",
        'Class C',
        'Quran',
      ),
      Employee(
        'Read Arabic',
        "Michael",
        'Class D',
        'Arabic',
      ),
      Employee(
        'Read Arabic',
        "Martin",
        'Class E',
        'Quran',
      ),
      Employee(
        'Arabic',
        "Newberry",
        'Class F',
        'Arabic',
      ),
      Employee(
        'Read Quran',
        "Balnc",
        'Class G',
        'Quran',
      ),
      Employee(
        'Read Quran',
        "Perry",
        'Class H',
        'Arabic',
      ),
      Employee(
        'Read Quran',
        "Gable",
        'Class I',
        'Quran',
      ),
      Employee(
        'Read Arabic',
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
    this.subject,
  );

  /// Id of an employee.
  final String studentName;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  final String subject;
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
              DataGridCell<String>(columnName: 'subject', value: e.subject),
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
