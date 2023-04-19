import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';
import 'package:student_roasting_admin/database/database.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:student_roasting_admin/widgets/exc_button.dart';
import 'package:student_roasting_admin/widgets/input_text.dart';
import 'package:student_roasting_admin/widgets/sidebar.dart';
import 'package:student_roasting_admin/widgets/styles.dart';

class AddTeachers extends StatefulWidget {
  const AddTeachers({super.key});

  @override
  State<AddTeachers> createState() => _AddTeachersState();
}

class _AddTeachersState extends State<AddTeachers> {
  TextEditingController teachername = TextEditingController();
  TextEditingController teacheremail = TextEditingController();
  TextEditingController teacherpassword = TextEditingController();
  TextEditingController teacherconfrimpassword = TextEditingController();
  TextEditingController teacherqualification = TextEditingController();

  TextEditingController teachersubjects = TextEditingController();
  TextEditingController assignedclass = TextEditingController();

  bool passwordVisible = false;
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

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
                    controller: teachername,
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
                    controller: teacheremail,
                    labelText: "example@gmail.com",
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      validateEmail(value);
                    },
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 9),
                            TextFormField(
                              validator: (value) {
                                // add your custom validation here.
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (value.length < 3) {
                                  return 'Must be more than 2 charater';
                                }
                              },
                              controller: teacherpassword,
                              obscureText: passwordVisible,
                              decoration: InputDecoration(
                                focusedBorder: AppStyles.focusedBorder,
                                disabledBorder: AppStyles.focusBorder,
                                enabledBorder: AppStyles.focusBorder,
                                errorBorder: AppStyles.focusErrorBorder,
                                focusedErrorBorder: AppStyles.focusErrorBorder,
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(
                                      () {
                                        passwordVisible = !passwordVisible;
                                      },
                                    );
                                  },
                                ),
                                alignLabelWithHint: false,
                                filled: true,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Confrim Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 9),
                            TextFormField(
                              validator: (value) {
                                // add your custom validation here.
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (value.length < 3) {
                                  return 'Must be more than 2 charater';
                                }
                              },
                              controller: teacherpassword,
                              obscureText: passwordVisible,
                              decoration: InputDecoration(
                                focusedBorder: AppStyles.focusedBorder,
                                disabledBorder: AppStyles.focusBorder,
                                enabledBorder: AppStyles.focusBorder,
                                errorBorder: AppStyles.focusErrorBorder,
                                focusedErrorBorder: AppStyles.focusErrorBorder,
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(
                                      () {
                                        passwordVisible = !passwordVisible;
                                      },
                                    );
                                  },
                                ),
                                alignLabelWithHint: false,
                                filled: true,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                      ),
                    ],
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
                    controller: teacherqualification,
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
                    controller: teachersubjects,
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
                    controller: assignedclass,
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
                    onPressed: addTeachers,
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

  void addTeachers() async {
    if (teacheremail.text.isEmpty &&
        teacherpassword.text.isEmpty &&
        teachername.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("All Fields are required")));
    } else if (teacheremail.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("email address is required")));
    } else if (teachername.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("name of the user is required")));
    } else if (teacherpassword.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("password is required")));
    } else {
      setState(() {
        _isLoading = true;
      });
      String rse = await DatabaseMethods().addTeachers(
        teacherType: "Teacher",
        teacheremail: teacheremail.text,
        teachername: teachername.text,
        teacherpassword: teacherpassword.text,
        teacherqualification: teacherqualification.text,
        teachersubjects: teachersubjects.text,
        cpassword: teacherpassword.text,
        assignedclass: assignedclass.text,
        blocked: false,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      print(rse);
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Conguration Data is Added")));
      Navigator.pop(context);
    }
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
