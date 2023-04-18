import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:student_roasting_admin/widgets/exc_button.dart';
import 'package:student_roasting_admin/widgets/input_text.dart';
import 'package:student_roasting_admin/widgets/sidebar.dart';

class StudentView extends StatefulWidget {
  StudentView({Key? key, required this.data}) : super(key: key);

  final QueryDocumentSnapshot<Object?> data;

  @override
  StudentViewState createState() => StudentViewState();
}

class StudentViewState extends State<StudentView> {
  TextEditingController parentname = TextEditingController();
  TextEditingController parentmobile = TextEditingController();
  TextEditingController studentname = TextEditingController();
  TextEditingController parentemail = TextEditingController();
  TextEditingController address = TextEditingController();

  TextEditingController studentclass = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController fees = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  var items = [
    'Enroll',
    'Expelled',
    'Drop-Out',
    'Leave',
  ];
  String dropdownvalue = 'Enroll';
  @override
  Widget build(BuildContext context) {
    parentname.text = widget.data.get("parentname");
    parentmobile.text = widget.data.get("parentmobile");
    studentname.text = widget.data.get("studentname");

    parentemail.text = widget.data.get("parentemail");

    address.text = widget.data.get("addressStudent");
    studentclass.text = widget.data.get("studentclass");
    subject.text = widget.data.get("subject");

    fees.text = widget.data.get("fees").toString();

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
            width: 340,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  ${widget.data.get("password")}'),

              Center(
                child: Container(
                  height: 600,
                  width: 509.55,
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  "Update Parent Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: InputText(
                                controller: parentname,
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
                                  "Update Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: InputText(
                                controller: parentemail,
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
                                  "Update Mobile Number",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: InputText(
                                controller: parentmobile,
                                labelText: "+9923059634",
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
                                  "Update Class",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: InputText(
                                controller: studentclass,
                                labelText: "Class A, Class B, Class C",
                                keyboardType: TextInputType.number,
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
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Update Subject",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: InputText(
                                controller: subject,
                                labelText: "Class A, Class B, Class C",
                                keyboardType: TextInputType.number,
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
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Update Address",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: InputText(
                                controller: address,
                                labelText: "Class A, Class B, Class C",
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                onSaved: (val) {},
                                textInputAction: TextInputAction.done,
                                isPassword: false,
                                enabled: true,
                              ),
                            ),

                            const SizedBox(
                              height: 9,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Update Student Status",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),

                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: DropdownButton(
                                isDense: true,
                                isExpanded: true,
                                // Initial Value
                                value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
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
          .collection('students')
          .doc(widget.data.get("uuid"))
          .update({
        "parentname": parentname.text,
        "parentmobile": parentmobile.text,
        "studentname": studentname.text,
        "parentemail": parentemail.text,
        "addressStudent": address.text,
        "studentclass": studentclass.text,
        "subject": subject.text,
        "studentStatus": dropdownvalue
      });

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Student Profile Update Successfully")));
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
                Text('Are You Sure To Delete The Student Profile.'),
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
                    .collection('students')
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
