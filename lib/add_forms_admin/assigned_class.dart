import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:student_roasting_admin/database/database.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:student_roasting_admin/widgets/exc_button.dart';
import 'package:student_roasting_admin/widgets/sidebar.dart';

class AssignedClass extends StatefulWidget {
  final teacherUid;
  final teachername;
  const AssignedClass(
      {super.key, required this.teacherUid, required this.teachername});

  @override
  State<AssignedClass> createState() => _AssignedClassState();
}

class _AssignedClassState extends State<AssignedClass> {
  final values = List.filled(7, true);

  bool _isLoading = false;
  String dropDownStudentClass = 'Class';
  String dropDownStudentName = "Student Name";
  String dropDownStudentSubject = "Student Subject";

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
                    "Class Management Portal",
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
                      "Select Student Name",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("students")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        return Column(
                          children: [
                            Container(
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                    isFilterOnline: true,
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(child: Text("Search Name")),
                                    ),
                                    showSelectedItems: true,
                                    disabledItemFn: (String s) =>
                                        s.startsWith('I'),
                                  ),
                                  items: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                        Map<String, dynamic> data = document
                                            .data()! as Map<String, dynamic>;
                                        return data["studentname"];
                                      })
                                      .toList()
                                      .cast<String>(),
                                  selectedItem: dropDownStudentName,
                                  onChanged: (String? day) {
                                    print(day);
                                    setState(() {
                                      dropDownStudentName = day!;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                  const SizedBox(height: 10),
                  //Plot Price
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Student Class",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("students")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        return Column(
                          children: [
                            Container(
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                    isFilterOnline: true,
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text("Search Student Class")),
                                    ),
                                    showSelectedItems: true,
                                    disabledItemFn: (String s) =>
                                        s.startsWith('I'),
                                  ),
                                  items: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                        Map<String, dynamic> data = document
                                            .data()! as Map<String, dynamic>;
                                        return data["studentclass"];
                                      })
                                      .toList()
                                      .cast<String>(),
                                  selectedItem: dropDownStudentClass,
                                  onChanged: (String? day) {
                                    print(day);
                                    setState(() {
                                      dropDownStudentClass = day!;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                  const SizedBox(height: 9),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Student Subject",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("students")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        return Column(
                          children: [
                            Container(
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                    isFilterOnline: true,
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child:
                                              Text("Search Student Subject")),
                                    ),
                                    showSelectedItems: true,
                                    disabledItemFn: (String s) =>
                                        s.startsWith('I'),
                                  ),
                                  items: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                        Map<String, dynamic> data = document
                                            .data()! as Map<String, dynamic>;
                                        return data["subject"];
                                      })
                                      .toList()
                                      .cast<String>(),
                                  selectedItem: dropDownStudentSubject,
                                  onChanged: (String? day) {
                                    print(day);
                                    setState(() {
                                      dropDownStudentSubject = day!;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                  //Kashra Info
                  SizedBox(
                    height: 9,
                  ),

                  SizedBox(
                    height: 9,
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
                            "Assigned",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                    onPressed: makeDateSheet,
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

  void makeDateSheet() async {
    if (dropDownStudentName.isEmpty || dropDownStudentClass.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("All Fields are required")));
    } else {
      setState(() {
        _isLoading = true;
      });
      String rse = await DatabaseMethods().assinedClass(
        teacherUid: widget.teacherUid,
        teacherName: widget.teachername,
        studentclass: dropDownStudentClass,
        subject: dropDownStudentSubject,
        studentname: dropDownStudentName,
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      print(rse);
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Conguration Class is Assigned Added")));
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => SideDrawer()));
    }
  }
}
