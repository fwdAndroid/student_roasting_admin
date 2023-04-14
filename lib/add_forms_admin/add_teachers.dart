import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:student_roasting_admin/widgets/exc_button.dart';
import 'package:student_roasting_admin/widgets/input_text.dart';
import 'package:student_roasting_admin/widgets/sidebar.dart';

class AddTeachers extends StatefulWidget {
  const AddTeachers({super.key});

  @override
  State<AddTeachers> createState() => _AddTeachersState();
}

class _AddTeachersState extends State<AddTeachers> {
  TextEditingController _plotName = TextEditingController();
  TextEditingController _plotPrice = TextEditingController();
  TextEditingController _plotKhasra = TextEditingController();
  TextEditingController _plotLocation = TextEditingController();
  bool _isLoading = false;
  String dropdownValue = 'Project Name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Go Back",
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
      body: Row(
        children: [
          Container(
            color: Color(0xff2294ed),
            width: 260,
            child: Column(
              children: [
                DrawerHeader(child: Image.asset("assets/logo.png")),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        selectedTileColor: Color(0xffeb4474),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.school),
                        iconColor: Colors.white,
                        title: Text(
                          'Student Managment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.space_dashboard_outlined),
                        iconColor: Colors.white,
                        title: Text(
                          'Teacher Management',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.date_range),
                        iconColor: Colors.white,
                        title: Text(
                          'DateSheet Management',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.payment),
                        iconColor: Colors.white,
                        title: Text(
                          'Payment Managment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.notifications),
                        iconColor: Colors.white,
                        title: Text(
                          'Notifications',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 320,
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              width: 448,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Teacher Management System",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 22.63),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Teacher Name",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  InputText(
                    controller: _plotName,
                    labelText: "Geroge",
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {},
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  InputText(
                    controller: _plotName,
                    labelText: "fwdkaleem@gmail.com",
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {},
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  InputText(
                    controller: _plotName,
                    labelText: "********",
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {},
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Confrim Password",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  InputText(
                    controller: _plotName,
                    labelText: "********",
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {},
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),
                  const SizedBox(height: 10),
                  //Plot Price
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Qualification",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  InputText(
                    controller: _plotPrice,
                    labelText: "Masters",
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),
                  const SizedBox(height: 9),
                  //location of plot
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Subjects",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  InputText(
                    controller: _plotLocation,
                    labelText: "Quran, Arabic, English",
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),
                  //Kashra Info
                  SizedBox(
                    height: 9,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Assigned Class",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  InputText(
                    controller: _plotKhasra,
                    labelText: "Class A, Class B, Class C",
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),

                  SizedBox(
                    height: 9,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Salary",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  InputText(
                    controller: _plotKhasra,
                    labelText: "234",
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),

                  SizedBox(height: 10),
                  const SizedBox(height: 30),
                  WonsButton(
                    height: 50,
                    width: 348,
                    verticalPadding: 0,
                    color: AppColors.primary,
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                    onPressed: () {},
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
