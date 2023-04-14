import 'package:flutter/material.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class PaymentManagement extends StatefulWidget {
  /// Creates the home page.
  PaymentManagement({Key? key}) : super(key: key);

  @override
  _PaymentManagementState createState() => _PaymentManagementState();
}

class _PaymentManagementState extends State<PaymentManagement> {
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
      // floatingActionButton: Container(
      //   width: 200,
      //   child: FloatingActionButton(
      //     backgroundColor: AppColors.primary,
      //     shape: BeveledRectangleBorder(
      //       borderRadius: BorderRadius.circular(10.0),
      //     ),
      //     onPressed: () {},
      //     child: Text("Add Payment"),
      //   ),
      // ),
      body: SfDataGrid(
        selectionMode: SelectionMode.multiple,
        source: employeeDataSource,
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
                  child: Text('Total Payment'))),
          GridColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Recived',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'salary',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Remaining'))),
          GridColumn(
              columnName: 'status',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Payment Status'))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee("James", '20000', '1000', 20000, "Completed"),
      Employee("Kathryn", '20000', '1000', 30000, "Remaining"),
      Employee("Lara", '20000', '1000', 15000, "Remaining"),
      Employee("Michael", '20000', '1000', 15000, "Remaining"),
      Employee("Martin", '20000', '1000', 15000, "Completed"),
      Employee("Newberry", '20000', '1000', 15000, "Remaining"),
      Employee("Balnc", '20000', '1000', 15000, "Completed"),
      Employee("Perry", '20000', '1000', 15000, "Completed"),
      Employee("Gable", '20000', '1000', 15000, "Remaining"),
      Employee("Grimes", '20000', '1000', 15000, "Remaining")
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(
      this.studentName, this.name, this.designation, this.salary, this.status);

  /// Id of an employee.
  final String studentName;

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
                  columnName: 'studentName', value: e.studentName),
              DataGridCell<String>(columnName: 'class', value: e.name),
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
