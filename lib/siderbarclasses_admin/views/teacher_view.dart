import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_roasting_admin/add_forms_admin/assigned_class.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:student_roasting_admin/widgets/exc_button.dart';
import 'package:student_roasting_admin/widgets/input_text.dart';
import 'package:student_roasting_admin/widgets/sidebar.dart';
import 'package:student_roasting_admin/widgets/styles.dart';

class TeacherView extends StatefulWidget {
  TeacherView({Key? key, required this.data}) : super(key: key);

  final QueryDocumentSnapshot<Object?> data;

  @override
  TeacherViewState createState() => TeacherViewState();
}

class TeacherViewState extends State<TeacherView> {
  TextEditingController teachername = TextEditingController();
  TextEditingController teacherqualification = TextEditingController();
  TextEditingController teachersubjects = TextEditingController();
  TextEditingController assignedclass = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    teacherqualification.text = widget.data.get("teacher_qualification");
    teachername.text = widget.data.get("teacher_name");
    teachersubjects.text = widget.data.get("teacher_subjects");

    assignedclass.text = widget.data.get("teacher_class");

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
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
                        builder: (builder) => AssignedClass(
                              teacherUid: widget.data.get("uuid"),
                              teachername: widget.data.get("teacher_name"),
                            )));
              },
              child: Text("Assigned Class"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
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
        ],
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
            width: 340,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //  ${widget.data.get("password")}'),

              Center(
                child: Container(
                  height: 500,
                  width: 509.55,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Update Teacher Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 9),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: InputText(
                            controller: teachername,
                            labelText: "Geroge",
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {},
                            onSaved: (val) {},
                            textInputAction: TextInputAction.done,
                            isPassword: false,
                            enabled: true,
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        const SizedBox(height: 10),
                        //Plot Price
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Update Qualification",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 9),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: InputText(
                            controller: teacherqualification,
                            labelText: "Masters",
                            keyboardType: TextInputType.text,
                            onChanged: (value) {},
                            onSaved: (val) {},
                            textInputAction: TextInputAction.done,
                            isPassword: false,
                            enabled: true,
                          ),
                        ),
                        const SizedBox(height: 9),
                        //location of plot
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Update Subjects",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 9),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: InputText(
                            controller: teachersubjects,
                            labelText: "Quran, Arabic, English",
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            onSaved: (val) {},
                            textInputAction: TextInputAction.done,
                            isPassword: false,
                            enabled: true,
                          ),
                        ),
                        //Kashra Info
                        SizedBox(
                          height: 9,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Update Assigned Class",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 9),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: InputText(
                            controller: assignedclass,
                            labelText: "Class A, Class B, Class C",
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            onSaved: (val) {},
                            textInputAction: TextInputAction.done,
                            isPassword: false,
                            enabled: true,
                          ),
                        ),

                        const SizedBox(height: 20),
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
                                  "Update",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                          onPressed: updateTeachers,
                        ),
                        const SizedBox(height: 9),
                        TextButton(
                            onPressed: alertDelete, child: Text("Delete"))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateTeachers() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await FirebaseFirestore.instance
          .collection('teachers')
          .doc(widget.data.get("uuid"))
          .update({
        "teacher_class": assignedclass.text,
        "teacher_name": teachername.text,
        "teacher_qualification": teacherqualification.text,
        "teacher_subjects": teachersubjects.text
      });

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Teacher Profile Update Successfully")));
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => SideDrawer()));
    } catch (e) {
      print(e.toString());
    }
  }

  void alertDelete() async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are You Sure To Delete The Teacher Profile.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                await _auth.currentUser!.delete();
                await FirebaseFirestore.instance
                    .collection('teachers')
                    .doc(widget.data.get("uuid"))
                    .delete();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Teacher Profile is Deleted")));
                setState(() {
                  _isLoading = false;
                });

                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SideDrawer()));
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
